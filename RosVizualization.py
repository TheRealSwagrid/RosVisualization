import sys
from time import sleep

from AbstractVirtualCapability import AbstractVirtualCapability, VirtualCapabilityServer, formatPrint

class RosVizualization(AbstractVirtualCapability):

    def __int__(self, server):
        super().__init__(server)

    def loop(self):
        pass

if __name__ == "__main__":
    try:
        port = None
        if len(sys.argv[1:]) > 0:
            port = int(sys.argv[1])
        server = VirtualCapabilityServer(port)
        tf = RosVizualization(server)
        tf.start()
        while server.running:
            sleep(.1)
        # Needed for properly closing, when program is being stopped wit a Keyboard Interrupt
    except KeyboardInterrupt:
        print("[Main] Received KeyboardInterrupt")


