<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
      xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
      xmlns="http://www.w3.org/2000/svg">
      <xsl:output method="xml" indent="yes"/>
      <!--GLOBAL VARIABLES-->
      <xsl:variable name="synsetFile" select="document('fullList_syn.xml')"/>
      <xsl:variable name="mostAmbigWord"
            select="descendant::word[synsetCount = max($synsetFile//descendant::word//synsetCount)]"/>
      <xsl:variable name="mostAmbigWordSynsetCount"
            select="descendant::word[synsetCount = max($synsetFile//descendant::word//synsetCount)]//synsetCount"/>

      <xsl:template match="/">
            <xsl:comment><xsl:value-of select="$mostAmbigWord"/><xsl:text>: </xsl:text><xsl:value-of select="$mostAmbigWordSynsetCount"/><xsl:text>          </xsl:text></xsl:comment>

            <xsl:for-each select="descendant::word">
                  <xsl:sort select="descendant::synsetCount/number()" order="descending"/>
                  <xsl:if test="position() &lt;= 10">
                        <xsl:value-of select="descendant::w"/>
                        <xsl:text>; </xsl:text>
                        <xsl:value-of select="descendant::synsetCount"/>
                        <xsl:text>     ***     </xsl:text>
                  </xsl:if>
            </xsl:for-each>
            <!-- RJP:the first word should be wilder with synset of 15 but for some reason it is starting as if the highest synset count is 9. It is as if fn:position cannot calculate double digits -->

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
