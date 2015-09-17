#!/usr/bin/env python3
import os
import re

CATALOGUE = "../study-catalogue.wiki"
ABOUT = "."
STUDY_DICT = {
    "GIP-German-Internet-Panel.md": "gip-panel",
    "Glueckstrend.md": "glueckstrend",
    "Pairfam.md": "pairfam-panel",
    "SOEP-BASE.md": "soep-base",
    "SOEP-Core.md": "soep-core",
    "SOEP-FID.md": "soep-fid",
    "SOEP-IAB.md": "iab-soep",
    "SOEP-IS.md": "soep-is",
    "SOEP-K2ID.md": "soep-k2id",
    "SOEP-LEE.md": "soep-lee",
    "SOEPlong.md": "soep-long",
    "SOEP-Pretest.md": "soep-pretest",
    "Twinlife.md": "twinlife-panel",

}

for old, new in STUDY_DICT.items():
    old_f = os.path.join(CATALOGUE, old)
    new_p = os.path.join(ABOUT, new)
    new_f = os.path.join(new_p, "index.md")
    os.system("mkdir -p %s" % new_p)
    os.system("cp %s %s" % (old_f, new_f))
    with open(new_f, "r+") as f:
        old = f.read()
        f.seek(0)
        f.write("---\n---\n\n" + old)


with open("index.md", "w") as f:
    s = "---\n---\n\n# Studies\n\n"
    studies = [ "* [%s](%s)" % (b, b) for a, b in STUDY_DICT.items() ]
    s = s + "\n".join(studies)
    f.write(s)
    

