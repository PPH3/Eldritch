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

      <xsl:variable name="ySpacer" select="20"/>
      <xsl:template match="/">
            <svg width="100%" height="100%">
                  <g transform="translate(100 400)">
                        <!-- X-Axis -->
                        <line x1="0" x2="1000" y1="0" y2="0" stroke="black" stroke-width="5"/>
                        <!-- Y-Axis -->
                        <line x1="0" x2="0" y1="0" y2="-{15 * $ySpacer}" stroke="black"
                              stroke-width="5"/>
                        
                        <xsl:for-each select="descendant::word">
                              <xsl:sort select="descendant::synsetCount/number()" order="descending"/>
                              <xsl:if test="position() &lt;= 5">
                                    <xsl:variable name="totalCount" select="descendant::totalCount"/>
                                    <xsl:variable name="CallCount"
                                          select="descendant::work[title = 'The Call of Cthulhu']/localCount"/>
                                    <xsl:variable name="MtnsCount"
                                          select="descendant::work[title = 'At The Mountains of Madness']/localCount"/>
                                    <xsl:variable name="ShadowsCount"
                                          select="descendant::work[title = 'The Shadow Over Innsmouth']/localCount"/>


                                    <xsl:comment>TOTAL: <xsl:value-of select="$totalCount"/></xsl:comment>
                                    <xsl:comment>Call: <xsl:value-of select="$CallCount"/></xsl:comment>
                                    <xsl:comment>Mtns: <xsl:value-of select="$MtnsCount"/></xsl:comment>
                                    <xsl:comment>Shadows: <xsl:value-of select="$ShadowsCount"/></xsl:comment>

                              </xsl:if>
                        </xsl:for-each>
                        
                        <xsl:for-each select="descendant::word">
                              <xsl:sort select="descendant::synsetCount/number()" order="ascending"/>
                              <xsl:if test="position() &lt;= 5">
                                    <xsl:variable name="totalCount" select="descendant::totalCount"/>
                                    <xsl:variable name="CallCount"
                                          select="descendant::work[title = 'The Call of Cthulhu']/localCount"/>
                                    <xsl:variable name="MtnsCount"
                                          select="descendant::work[title = 'At The Mountains of Madness']/localCount"/>
                                    <xsl:variable name="ShadowsCount"
                                          select="descendant::work[title = 'The Shadow Over Innsmouth']/localCount"/>


                                    <xsl:comment>TOTAL: <xsl:value-of select="$totalCount"/></xsl:comment>
                                    <xsl:comment>Call: <xsl:value-of select="$CallCount"/></xsl:comment>
                                    <xsl:comment>Mtns: <xsl:value-of select="$MtnsCount"/></xsl:comment>
                                    <xsl:comment>Shadows: <xsl:value-of select="$ShadowsCount"/></xsl:comment>

                              </xsl:if>
                        </xsl:for-each>
                  </g>
            </svg>
      </xsl:template>
</xsl:stylesheet>
