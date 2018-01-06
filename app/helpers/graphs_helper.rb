# Graph helper methods.
module GraphsHelper

  # Defines the colors for the graphs.
  GRAPH_COLORS = [
    {
      background_color: 'rgba(255, 99, 132, 0.2)',
      border_color: 'rgba(255,99,132,1)'
    },
    {
      background_color: 'rgba(54, 162, 235, 0.2)',
      border_color: 'rgba(54, 162, 235, 1)'
    },
    {
      background_color: 'rgba(255, 206, 86, 0.2)',
      border_color: 'rgba(255, 206, 86, 1)'
    }
  ].freeze

  # Fetch conflict status
  def conflict_status_hash
    ret = {}

    SmartValidatorDb::ValidatedRoasVerifiedAnnouncement.select(
      'route_validity, COUNT(*)'
    ).group(
      :route_validity
    ).each_with_index do |conflict_entry, i|
      current_color_hash = GRAPH_COLORS[i % GRAPH_COLORS.length]
      ret[conflict_entry.route_validity.to_sym] = {
        label: I18n.t("activerecord.meta.smart_validator_db.validated_roas_verified_announcement.#{conflict_entry.route_validity}"),
        count: conflict_entry.count,
        background_color: current_color_hash[:background_color],
        border_color: current_color_hash[:border_color]
      }
    end

    ret
  end

  # Fetch the bgb status hash
  def bgp_status_hash
    {
      unknown_count: {
        label: I18n.t("views.pages.index.graphs.bgp_status.unknown_count"),
        count: SmartValidatorDb::Announcement.find_by_sql(
          'SELECT COUNT(announcements.*) FROM announcements LEFT JOIN validated_roas_verified_announcements ON (announcements.id = validated_roas_verified_announcements.announcement_id) WHERE validated_roas_verified_announcements.announcement_id IS NULL;'
        ).to_a.first.count,
        background_color: GRAPH_COLORS[0][:background_color],
        border_color: GRAPH_COLORS[0][:border_color]
      },
      valid_count: {
        label: I18n.t("views.pages.index.graphs.bgp_status.valid_count"),
        count: SmartValidatorDb::ValidatedRoasVerifiedAnnouncement.all.where(route_validity: 0).count,
        background_color: GRAPH_COLORS[1][:background_color],
        border_color: GRAPH_COLORS[1][:border_color]
      },
      conflict_count: {
        label: I18n.t("views.pages.index.graphs.bgp_status.conflict_count"),
        count: SmartValidatorDb::ValidatedRoasVerifiedAnnouncement.all.where('route_validity=1 OR route_validity=2').count,
        background_color: GRAPH_COLORS[2][:background_color],
        border_color: GRAPH_COLORS[2][:border_color]
      }
    }
  end

  # Fetches the data for the conflict timeline.
  def timeline_conflicts_hash
    ret = {}

    SmartValidatorDb::TimelineConflicts.all.last(
      Rails.configuration.global[:pages][:index][:timeline_conflicts][:show_last_n_entries]
    ).each_with_index do |timeline_conflict, i|
      current_color_hash = GRAPH_COLORS[i % GRAPH_COLORS.length]
      ret["p#{i}".to_sym] = {
        label: timeline_conflict.check_date.strftime("%Y-%m-%d / %H:%M"),
        count: timeline_conflict.count,
        background_color: current_color_hash[:background_color],
        border_color: current_color_hash[:border_color]
      }
    end

    # Make sure to have always the same amount of data points.
    old_ret_length = ret.length
    old_ret_length.upto(Rails.configuration.global[:pages][:index][:timeline_conflicts][:show_last_n_entries]).each do |i|
      ret["p#{old_ret_length+i}".to_sym] = {
        label: '',
        count: 0,
        background_color: GRAPH_COLORS[0][:background_color],
        border_color: GRAPH_COLORS[0][:border_color]
      }
    end

    ret
  end

  # Returns the payload_roas_hash.
  def payload_roas_hash
    {
      original: {
        label: I18n.t('views.pages.index.graphs.payload_roas.original'),
        count: SmartValidatorDb::PayloadRoa.where(filtered: false).where(whitelisted: false).count,
        background_color: GRAPH_COLORS[0][:background_color],
        border_color: GRAPH_COLORS[0][:border_color]
      },
      filtered: {
        label: I18n.t('views.pages.index.graphs.payload_roas.filtered'),
        count: SmartValidatorDb::PayloadRoa.where(filtered: true).where(whitelisted: false).count,
        background_color: GRAPH_COLORS[1][:background_color],
        border_color: GRAPH_COLORS[1][:border_color]
      },
      whitelisted: {
        label: I18n.t('views.pages.index.graphs.payload_roas.whitelisted'),
        count: SmartValidatorDb::PayloadRoa.where(filtered: false).where(whitelisted: true).count,
        background_color: GRAPH_COLORS[2][:background_color],
        border_color: GRAPH_COLORS[2][:border_color]
      }
    }
  end

end
