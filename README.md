

##GraphLimit

A copy/paste of the standard Graph widget from the Dashing Dashboard (see: http://shopify.github.com/dashing for more information) that allows the entry of a limit (upper bound) which, when exceeded by the data received, will turn the graph red.

###Installation

Clone these files.

Copy widgets/graph_limit/* to the widgets directory in Dashing.

Copy the dashboards/graphlimit.erb file to the dashboards directory.

The dashboard widget defined in graphlimit.erb listens for 'load' events. To create some random ones for testing copy the jobs/load.rb file to the jobs directory and restart the dashing server.

Access the dashboard at /graphlimit

