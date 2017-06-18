class maverick_analysis (
    $influxdb = true,
    $collectd = true,
    $grafana = true,
) {
    
    file { ["/srv/maverick/data/analysis", "/srv/maverick/data/config/analysis"]:
        owner       => "mav",
        group       => "mav",
        mode        => "755",
        ensure      => directory,
    }

    if $influxdb == true {
        # Note class named influx instead of influxdb to not conflict with other classes
        class { "maverick_analysis::influx": }
    }
    
    if $collectd == true {
        # Note class named collect instead of collectd to not conflict with other classes
        class { "maverick_analysis::collect": }
    }
    
    if $grafana == true {
        # Note class name grafand instead of grafana to not conflict with other classes
        class { "maverick_analysis::grafana": }
    }
    
}