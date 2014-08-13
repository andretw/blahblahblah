import shutil
import os

filenames ="""
4J5A7856.jpg
4J5A7964.jpg
4J5A7982.jpg
4J5A8028.jpg
4J5A8050.jpg
4J5A8119.jpg
4J5A8242.jpg
4J5A8251.jpg
4J5A8476.jpg
4J5A8490.jpg
4J5A8546.jpg
4J5A8583.jpg
4J5A8620.jpg
4J5A8659.jpg
4J5A8678.jpg
4J5A8701.jpg
4J5A8720.jpg
4J5A8754.jpg
4J5A8789.jpg
4J5A8816.jpg
4J5A8854.jpg
4J5A8862.jpg
4J5A8878.jpg
4J5A8884.jpg
4J5A8919.jpg
4J5A8929.jpg
4J5A8990.jpg
IMG_4936.jpg
IMG_4981.jpg
IMG_5039.jpg
IMG_5061.jpg
IMG_5063.jpg
"""

filenames = filenames.strip().split('\n')
print filenames
print len(filenames)

src_dir = "/Volumes/MY_DATA_071314"
dst_dir = "/Users/andre/Downloads/weddingshots2"

for filename in filenames:
    if not "." in filename
        filename = filename + ".jpg"
    src = os.path.join(src_dir, filename)
    dst = os.path.join(dst_dir, filename)
    shutil.copyfile(src, dst)

print "### DONE ###"
