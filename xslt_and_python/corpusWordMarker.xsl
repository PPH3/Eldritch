<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:eld="http://eldritch.code.newtfire.org"
   xmlns:math="http://www.w3.org/2005/xpath-functions/math"
   xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs eld math"
    version="3.0">
    
    <xsl:output method="xml" indent="yes"/>
 <!--2016-12-14 ebb: This is the last stage of the Identity Transform pipeline. This XSLT plots information from fullList_syn.xml (the full wordlist with counts and synset info on each word back into words marked in the TEI of the collection. -->   
    
    <xsl:variable name="wordList" select="document('fullList_syn.xml')"/>
  <!--  <xsl:variable name="love" select="collection('../mark-up')"/>
  ebb: Trying to run the Identity Transform over the collection didn't work, so this variable wasn't useful. Since I couldn't use it, I ran this XSLT over each TEI file in the Eldritch corpus individually since there were only three. We could run this over the collection by setting up a project in oXygen, or by running the XSLT over the directory at command line. See http://dh.obdurodon.org/transformation-scenario.xhtml for details.
  -->
      
    <xsl:mode on-no-match="shallow-copy"/>
 <xsl:template match="w">
    <xsl:variable name="match" select="$wordList//eld:w[. = lower-case(current()/normalize-space())]"/>
     <w type="{$match/@type}" synsetCount="{$match/following-sibling::eld:synsetCount}"><xsl:apply-templates/></w>
 </xsl:template>
    
</xsl:stylesheet>