<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
      xmlns:xs="http://www.w3.org/2001/XMLSchema"
      exclude-result-prefixes="xs"
      xmlns="http://www.w3.org/2000/svg">
      <xsl:output method="xml" indent="yes"/>
      <!--GLOBAL VARIABLES-->
      <xsl:variable name="synsetFile" select="document('fullList_syn.xml')"/>
      <xsl:variable name="mostAmbigWord" select="descendant::word[synsetCount = max($synsetFile//descendant::word//synsetCount)]"/>
            <xsl:variable name="mostAmbigWordSynsetCount" select="descendant::word[synsetCount = max($synsetFile//descendant::word//synsetCount)]//synsetCount"/>
      <xsl:variable name="range" select="subsequence($synsetFile//synsetCount, $mostAmbigWordSynsetCount, 10)"/>
      
      <xsl:template match="/">
            <xsl:comment>Word with most synsets: <xsl:value-of select="$mostAmbigWord//descendant::w"/> 
                  Synset count: <xsl:value-of select="$mostAmbigWordSynsetCount"/></xsl:comment>
            
            <xsl:value-of select="$range"/> <!-- Well, that isnt working exactly like I expected. -->
           
      </xsl:template>
</xsl:stylesheet>












<!--<svg width="100%" height="100%">
      <g transform="translate(50 500)">
            <!-\- Y Axis -\->
            <line x1="75" x2="75" y1="0" y2="-450" stroke="black" stroke-width="1"/>
            <!-\- X Axis -\->
            <line x1="75" x2="1200" y1="0" y2="0" stroke="black" stroke-width="1"/>
            
      </g>
</svg>-->
