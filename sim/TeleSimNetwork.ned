package telesim.emulation.videostreaming;

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.ethernet.Eth100M;
import inet.node.ethernet.EthernetSwitch;
import inet.node.inet.Router;
import inet.node.inet.StandardHost;
import inet.visualizer.common.IntegratedVisualizer;

network TeleSimNetwork
{
    parameters:
        @display("bgb=1000,400");
    submodules:
        configurator: Ipv4NetworkConfigurator {
            parameters:
                @display("p=100,100;is=s");
        }
        visualizer: IntegratedVisualizer {
            parameters:
                @display("p=100,200;is=s");
        }
        switch1: EthernetSwitch {
            parameters:
                @display("p=300,300");
        }
        switch2: EthernetSwitch {
            parameters:
                @display("p=700,300");
        }
        router: Router {
            parameters:
                @display("p=500,300");
        }
        host1: StandardHost {
            parameters:
                @display("p=100,300");
        }
        host2: StandardHost {
            parameters:
                @display("p=900,300");
        }
    connections:
        host1.ethg++ <--> {
            delay = truncnormal(100ms, 25ms);
            per   = 0.001;
            datarate = 1000Mbps;
            @display("m=m,50,50,50,50");
        } <--> switch1.ethg++;

        switch1.ethg++ <--> {
            delay = 0s;
            per   = 0;
            datarate = 1000Mbps;
            @display("m=m,50,50,50,50");
        } <--> router.ethg++;

        router.ethg++ <--> {
            delay = 0s;
            per   = 0;
            datarate = 1000Mbps;
            @display("m=m,50,50,50,50");
        } <--> switch2.ethg++;

        switch2.ethg++ <--> {
            delay = 0s;
            per   = 0;
            datarate = 1000Mbps;
            @display("m=m,50,50,50,50");
        } <--> host2.ethg++;
}

