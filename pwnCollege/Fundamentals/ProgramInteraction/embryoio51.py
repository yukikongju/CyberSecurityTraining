import subprocess as sp

o = sp.Popen(['/challenge/embryoio_level51'], stdout=sp.PIPE, stderr=sp.PIPE)
out = sp.Popen(['rev'], stdin=o.stdout, stdout=sp.PIPE)
out = sp.Popen(['rev'], stdin=out.stdout, stdout=sp.PIPE)
r, e = out.communicate()


