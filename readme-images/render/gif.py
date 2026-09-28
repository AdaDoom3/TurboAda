#!/usr/bin/env python3
#  Joins the frames shots.js wrote (<name>-NN.png) into <name>.gif, each
#  frame shown for the seconds given, the last one longer, and removes them.
#    python3 gif.py <directory> <name> [seconds per frame]
import glob, os, sys
from PIL import Image

directory, name = sys.argv[1], sys.argv[2]
hold = float(sys.argv[3]) if len(sys.argv) > 3 else 1.8
frames = sorted(glob.glob(os.path.join(directory, name + '-[0-9][0-9].png')))
if not frames:
    sys.exit(f'no frames named {name}-NN.png in {directory}')
images = [Image.open(f).convert('RGB').quantize(colors=255, method=Image.Quantize.MEDIANCUT) for f in frames]
durations = [int(hold * 1000)] * (len(images) - 1) + [int(hold * 2500)]
images[0].save(os.path.join(directory, name + '.gif'), save_all=True,
               append_images=images[1:], duration=durations, loop=0, optimize=False)
for f in frames:
    os.remove(f)
print('wrote', name + '.gif', 'from', len(frames), 'frames')
