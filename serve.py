#/usr/bin/env python3
import subprocess
import asyncio
from watchgod import awatch

print("This will rerun the publish.sh command WITHOUT printing the PDF.")
print("When you make changes to your first document it will start an HTTP server on port 8888")

async def main():
    try:
        async for changes in awatch("./content"):
            proc = subprocess.run(["./publish.sh", "noprint"], capture_output=True)
            proc = subprocess.run(["./server.sh"], capture_output=True)
            print("Changes Detected! DEBUG OUTPUT BELOW ------ \r\n")
            print(proc)
    except Exception:
        pass

loop = asyncio.get_event_loop()
loop.run_until_complete(main())
