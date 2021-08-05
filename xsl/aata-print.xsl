<?xml version='1.0'?>

<!-- This file is part of the book                 -->
<!--                                               -->
<!--   Abstract Algebra: Theory and Applications   -->
<!--                                               -->
<!-- Copyright (C) 1997-2014  Thomas W. Judson     -->
<!-- See the file COPYING for copying conditions.  -->

<!-- For the print version of the book, nothing electronic    -->
<!-- Includes Sage remarks, but none of the other Sage extras -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- Copy current file (aata-print.xsl) into mathbook/user -->
<!-- Then other imports are all relative to that directory -->

<!-- Copy  aata-latex.xsl  into  mathbook/user                 -->
<!-- aata-latex.xsl  will subsequently import  aata-common.xsl -->
<xsl:import href="aata-latex.xsl" />

<!-- Each Chapter has a <paragraphs> about Sage,      -->
<!-- which will be included by default                -->
<!-- But print copies of AATA will not include        -->
<!-- the two Sage sections (discussion and exercise)  -->
<!-- This is where we kill these two sections by      -->
<!-- doing nothing with their content wrap templates  -->
<!-- in the chunking scheme.  We presume we build one -->
<!-- big TeX file, otherwise we might wish to also    -->
<!-- kill a file wrap template as well.               -->
<xsl:template match="section[title='Sage']" />
<xsl:template match="exercises[title='Sage Exercises']" />

</xsl:stylesheet>