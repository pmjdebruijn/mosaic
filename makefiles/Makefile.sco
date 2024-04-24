# Toplevel Makefile for NCSA Mosaic.

# You shouldn't need to touch any of the Makefiles in the various
# subdirectories if you configure this Makefile correctly.

# If you need to make serious changes to get Mosaic to compile on your
# platform, send context diffs to mosaic-x@ncsa.uiuc.edu.

# -------------------------- CUSTOMIZABLE OPTIONS ----------------------------

prereleaseflags = -DPRERELEASE

RANLIB = /bin/true
#### On non-SGI's, this should be ranlib.
# RANLIB = ranlib

#CC = cc
#### On Sun's, this should be gcc (ANSI required).
CC = cc

#### Linker Flags -- Primarily for linking static on linux-elf.
#ldflags = -static
ldflags =

#### For a few files in the source, some compilers may need to be kicked
#### in K&R mode.  E.g., on SGI's, -cckr does this.
# knrflag = -cckr
#### On most systems, no flag is needed.
knrflag =


#### Random system configuration flags.
#### --> *** For Motif 1.2 ON ANY PLATFORM, do -DMOTIF1_2 *** <--
#### For IBM AIX 3.2, do -D_BSD
#### For NeXT, do -DNEXT
#### For HP/UX, do -Aa -D_HPUX_SOURCE
#### For Dell SVR4, do -DSVR4
#### For Solaris, do -DSVR4 -DSOLARIS
#### For Esix 4.0.4 and Solaris x86 2.1, do -DSVR4
#### For Convex whatever, do -DCONVEX
#### For SCO ODT 3.0, do -DSCO -DSVR4 -DMOTIF1_2
#### For Motorola SVR4, do -DSVR4 -DMOTOROLA -DMOTIF1_2
sysconfigflags = -DSVR4 -DMOTIF1_2 -DSCO -g

#### System libraries.
# syslibs = -lPW -lsun -lmalloc
#### For AIX 3.2
# syslibs = -lPW -lbsd
#### For most other Motif platforms:
# syslibs = -lPW
#### For Sun's and Ultrix and HP and BSD/386:
# syslibs =
#### For Sun's with no DNS:
# syslibs = -lresolv
#### For SCO ODT:
syslibs = -lPW -lsocket -lmalloc
#### For Dell SVR4:
# syslibs = -lnsl -lsocket -lc -lucb
#### For Solaris (2.x)  --nsl does not link correctly staticly.
# syslibs = -lnsl /usr/lib/libsocket.a /usr/ccs/lib/libgen.a
#### For Motorola SVR4:
# syslibs = -lnsl -lsocket -lgen


#### X include file locations -- if your platform puts the X include
#### files in a strange place, set this variable appropriately.  Else
#### don't worry about it.
#### HP X11R4 version:
# xinc = -I/usr/include/Motif1.1 -I/usr/include/X11R4
#### HP X11R5 version:
# xinc = -I/usr/include/Motif1.2 -I/usr/local/X11R5/include
#### NeXT version:
# xinc = -I/usr/include/X11
#### BSD/386
# xinc = -I/usr/X11/include
#### Solaris 2.x (Patched X11R5 and Motif libs)
# xinc = -I/usr/openwin/include -I/usr/dt/include

#### X library locations.
# xlibs = -lXm_s -lXmu -lXt_s -lX11_s
#### For Sun's (at least running stock X/Motif as installed on our machines):
# xlibs = /usr/lib/libXm.a /usr/lib/libXmu.a /usr/lib/libXt.a /usr/lib/libXext.a /usr/lib/libX11.a -lm
#### For HP-UX 8.00:
# xlibs = -L/usr/lib/Motif1.1 -lXm -L/usr/lib/X11R4 -lXmu -lXt -lX11
#### For HP-UX 9.01: The X11R5 libraries are here on our systems
# xlibs = -L/usr/lib/Motif1.2 -lXm -L/usr/lib/X11R5 -L/usr/lib/X11R4 -lXmu -lXt -lX11
#### For NeXT:
# xlibs = -L/usr/lib/X11 -lXm -lXmu -lXt -lX11
#### For Dell SVR4:
# xlibs = -L/usr/X5/lib -lXm -lXmu -lXt -lXext -lX11
#### For Solaris (2.x) (Use static to go from machine to machine)
#xlibs = -L/usr/openwin/lib -L/usr/dt/lib -R/usr/dt/lib -lXm
#xlibs += /usr/openwin/lib/libXmu.a /usr/openwin/lib/libXt.a
#xlibs += /usr/openwin/lib/libXext.a -lX11
#xlibs += /usr/lib/libm.a
#### For SCO ODT 3.0 (I'm told that -lXtXm_s is *not* a typo :-):
#xlibs = -lXtXm_s -lXmu -lX11_s
#### For SCO OpenServer 5.0 
xlibs = -lXm -lXt -lXmu -lX11
#### For nearly everyone else:
# xlibs = -lXm -lXmu -lXt -lX11
#### For BSD/386:
# xlibs = -L/usr/X11/lib -lXm -lXmu -lXt -lX11
#### For Motorola SVR4:
# xlibs = -lXm -lXmu -lXt -lXext -lX11 -lm


#### DTM AND HDF SUPPORT; READ CAREFULLY

#### If you want to compile with DTM and HDF support, you should leave
#### the following lines uncommented and make sure you have a copy of
#### HDF 3.3 (r1 or later) installed and ready.  You can find HDF on
#### ftp.ncsa.uiuc.edu in /HDF.

#### If you do not want to compile with DTM and HDF support, comment
#### the following lines out.  (If you are compiling from source for
#### the first time, you should probably not bother with HDF and DTM
#### support.)

#### dtmmachtype needs to be set to one of the following:
####   sun, sgi, dec, ibm, next, cray, convex
#### If your platform is not one of the above, then either do not compile
#### with HDF/DTM support or try hacking libdtm/makefile.

#dtmmachtype = solarisx86
#dtmdirs = libdtm libnet
#dtmlibs = ../libnet/libnet.a ../libdtm/libdtm.a
#dtmflags = -DHAVE_DTM -I.. -I../libnet
#hdfdir = /hdf2/install/solarisx86
#hdflibs = $(hdfdir)/lib/libmfhdf.a $(hdfdir)/lib/libdf.a
#hdfflags = -DHAVE_HDF -DHDF -I$(hdfdir)/include

#### PNG SUPPORT
#### For inline PNG support, the following should be defined:
#### The libraries currently used are PNGLIB 0.81 and ZLIB 0.95

pngdir = /xdev/mosaic/libpng/sco
pnglibdir = $(pngdir)/lib
pngincludedir = $(pngdir)/include
pnglibs = $(pnglibdir)/libpng.a $(pnglibdir)/libz.a -lm
pngflags =  -I$(pngincludedir) -DHAVE_PNG

#### JPEG SUPPORT
#### For inline JPEG support, the following should be defined:
#### The library used is Independent JPEG Group (IJG's) 5.0a.

jpegdir = /xdev/mosaic/libjpeg/sco
jpeglibs = $(jpegdir)/lib/libjpeg.a
jpegflags = -I$(jpegdir)/include -DHAVE_JPEG


#### KERBEROS SUPPORT
####
#### If you want Mosaic to support Kerberos authentication, set the 
#### following flags appropriately.  You can support Kerberos V4 and/or V5,
#### although it's most likely that your realm supports one or the other.
#### To enable DES-encryption of HTTP messages via Kerberos key exchange, 
#### define the KRB-ENCRYPT flag.

##krb4dir   = /usr/athena
#krb4dir   = /xdev/mosaic/libkrb4/solaris-24
#krb4libs  = $(krb4dir)/lib/libkrb.a $(krb4dir)/lib/libdes.a
#krb4flags = -DKRB4 -I$(krb4dir)/include

##krb5dir   = /krb5
#krb5dir   = /xdev/mosaic/libkrb5/solaris-24
#krb5libs  = $(krb5dir)/lib/libkrb5.a $(krb5dir)/lib/libcrypto.a $(krb5dir)/util/et/libcom_err.a
#krb5flags = -DKRB5 -I$(krb5dir)/include -I$(krb5dir)/include/krb5

#Do not comment out.
krbflags  = $(krb4flags) $(krb5flags)
krblibs   = $(krb4libs) $(krb5libs) 


#### DIRECT WAIS SUPPORT

#### If you want to have Mosaic be able to communicate directly with
#### WAIS servers, do set the following flags appropriately.  We
#### recommend linking with CNIDR's freeWAIS 0.5 distribution; other
#### WAIS distributions may work but we have not tested them with
#### Mosaic.  freeWAIS 0.5 can currently (Sept.1995) be found at
#### ftp://sunsite.unc.edu/pub/wais/servers/freeWAIS 

#### If you do not wish to link to the WAIS libraries, then comment
#### the following lines out.  Mosaic will then communicate with WAIS
#### servers via a HTTP gateway.

#### -lm is required for freeWAIS 0.5, as ceil() is used.

#waisroot = /xdev/mosaic/freeWAIS/solaris24x86
#waisflags = -DDIRECT_WAIS -I$(waisroot)/include
#waislibdir = $(waisroot)/bin
#waislibs = $(waislibdir)/inv.a $(waislibdir)/wais.a $(waislibdir)/libftw.a -lm



#### Customization flags:
#### . If you want Mosaic to come up with monochrome colors by default,
####   use -DMONO_DEFAULT
#### . If you want to define the default Mosaic home page, set
####   -DHOME_PAGE_DEFAULT=\\\"url\\\"
#### . If you want to define the default Mosaic documentation directory
####   (should be a URL), set -DDOCS_DIRECTORY_DEFAULT=\\\"url\\\"
#### . Other things you can define are spelled out in src/mosaic.h.
customflags =




########
########
####      NOTE! If you get errors because of the following line, it means
####      you are NOT using GNUs Make program. The following line is basically
####      for the developers at NCSA to customize the build process without
####      modifying the Makefiles, so you may comment it out without harm.
########
########
-include local-defines/$(DEV_ARCH)



# ---------------------- END OF CUSTOMIZABLE OPTIONS -------------------------


CFLAGS = -g $(sysconfigflags) $(prereleaseflags)

# Don't worry about these -- for development purposes only.
PURIFY = purify
QUANTIFY = quantify

default: $(dtmdirs) libwww2 libXmx libhtmlw libnut src
	@echo \*\*\* Welcome to NCSA Mosaic.
purifyd: $(dtmdirs) libwww2 libXmx libhtmlw libnut src-purifyd
	@echo \*\*\* Welcome to Purify'd NCSA Mosaic.
quantifyd: $(dtmdirs) libwww2 libXmx libhtmlw libnut src-quantifyd
	@echo \*\*\* Welcome to Quantify'd NCSA Mosaic.

libXmx::
	@echo --- Building libXmx
	cd libXmx; $(MAKE) CC=$(CC) RANLIB=$(RANLIB) CFLAGS="$(CFLAGS) $(xinc)"

libhtmlw::
	@echo --- Building libhtmlw
	cd libhtmlw; $(MAKE) CC=$(CC) RANLIB=$(RANLIB) CFLAGS="$(CFLAGS) $(knrflag) $(xinc) -DMOTIF -DXMOSAIC"

libwww2::
	@echo --- Building libwww2
	cd libwww2; $(MAKE) CC=$(CC) RANLIB=$(RANLIB) CFLAGS="$(CFLAGS) $(knrflag) $(waisflags) $(krbflags) $(xinc)"


libnut::
	@echo --- Building libnut
	cd libnut; $(MAKE) CC=$(CC) RANLIB=$(RANLIB) CFLAGS="$(CFLAGS) $(knrflag)"

src::
	@echo --- Building src
	cd src; $(MAKE) CC=$(CC) RANLIB=$(RANLIB) LDFLAGS="$(ldflags)" CFLAGS="$(CFLAGS) $(customflags) $(xinc) $(jpegflags) $(dtmflags) $(hdfflags) $(pngflags) $(krbflags) -I.. -I../libXmx -I../libwww2" AUX_CFLAGS=$(knrflag) X_LIBS="$(xlibs)" SYS_LIBS="$(sockslibs) $(syslibs)" DTM_LIBS="$(dtmlibs)" HDF_LIBS="$(hdflibs)" WAIS_LIBS="$(waislibs)" LIBWWW_DIR=../libwww2 JPEG_LIBS="$(jpeglibs)" PNG_LIBS="$(pnglibs)" KRB_LIBS="$(krblibs)" LIBNUT_DIR=../libnut MOSAIC="dtmosaic"

src-purifyd::
	@echo --- Building Purify'd src
	cd src; $(MAKE) PURIFY=$(PURIFY) CC=$(CC) RANLIB=$(RANLIB) LDFLAGS="$(ldflags)" CFLAGS="$(CFLAGS) $(customflags) $(xinc) $(jpegflags) $(dtmflags) $(hdfflags) $(pngflags) $(krbflags) -I.. -I../libXmx -I../libwww2" AUX_CFLAGS=$(knrflag) X_LIBS="$(xlibs)" SYS_LIBS="$(sockslibs) $(syslibs)" DTM_LIBS="$(dtmlibs)" HDF_LIBS="$(hdflibs)" WAIS_LIBS="$(waislibs)" LIBWWW_DIR=../libwww2 JPEG_LIBS="$(jpeglibs)" PNG_LIBS="$(pnglibs)" KRB_LIBS="$(krblibs)" LIBNUT_DIR=../libnut MOSAIC="Mosaic-p"

src-quantifyd::
	@echo --- Building Quantify'd src
	cd src; $(MAKE) PURIFY=$(QUANTIFY) CC=$(CC) RANLIB=$(RANLIB) LDFLAGS="$(ldflags)" CFLAGS="$(CFLAGS) $(customflags) $(xinc) $(jpegflags) $(dtmflags) $(hdfflags) $(pngflags) $(krbflags) -I.. -I../libXmx -I../libwww2" AUX_CFLAGS=$(knrflag) X_LIBS="$(xlibs)" SYS_LIBS="$(sockslibs) $(syslibs)" DTM_LIBS="$(dtmlibs)" HDF_LIBS="$(hdflibs)" WAIS_LIBS="$(waislibs)" LIBWWW_DIR=../libwww2 JPEG_LIBS="$(jpeglibs)" PNG_LIBS="$(pnglibs)" KRB_LIBS="$(krblibs)" LIBNUT_DIR=../libnut MOSAIC="Mosaic-q"

libnet::
	@echo --- Building libnet
	cd libnet; $(MAKE) CC=$(CC) RANLIB=$(RANLIB) CFLAGS="$(CFLAGS) $(dtmflags)"

libdtm::
	@echo --- Building libdtm
	cd libdtm; $(MAKE) $(dtmmachtype) CC=$(CC) RANLIB=$(RANLIB) CFLAGS="$(CFLAGS) $(dtmflags)"

clean:
	cd libXmx; $(MAKE) $@
	cd libhtmlw; $(MAKE) $@
	cd libwww2; $(MAKE) $@
	cd src; $(MAKE) $@
	cd libnet; $(MAKE) $@
	cd libdtm; $(MAKE) $@
	cd libnut; $(MAKE) $@

wclean:
	cd libhtmlw; $(MAKE) $@
	cd src; $(MAKE) $@

commit:
	cvs commit
update:
	cvs update
countlines:
	wc libdtm/*.[ch] libnet/*.[ch] libXmx/*.[ch] libhtmlw/*.[ch] libwww2/*.[ch] src/*.[ch]
replicate:
	cp Makefile Makefile.sun
	cp Makefile Makefile.ibm
	cp Makefile Makefile.dec
	cp Makefile Makefile.alpha
	cp Makefile Makefile.hp
prune:
	mv Makefile.sun Makefile.sun.old
	mv Makefile.ibm Makefile.ibm.old
	mv Makefile.dec Makefile.dec.old
	mv Makefile.alpha Makefile.alpha.old
	mv Makefile.hp Makefile.hp.old
