import subprocess as sp

o = sp.Popen(['cat'], stdin=sp.PIPE, stdout=sp.PIPE)
out = sp.Popen(['/challenge/embryoio_level52'], stdin=o.stdout, stdout=sp.PIPE)
r, e = out.communicate()
#  hybsgpbp
