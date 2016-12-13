<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
      xmlns:xs="http://www.w3.org/2001/XMLSchema"
      exclude-result-prefixes="xs"
      xmlns="http://www.w3.org/2000/svg">
      <xsl:output method="xml" indent="yes"/>
      <!--GLOBAL VARIABLES-->
      <xsl:variable name="synsetFile" select="document('fullList_syn.xml')"/>
      <xsl:variable name="totalWords" select="sum(descendant::word//totalCount)"/>
      <xsl:variable name="totalWordsShadow" select="sum(descendant::word[descendant::work[title='The Shadow Over Innsmouth'][xs:integer(localCount) gt 0]]/descendant::work[title='The Shadow Over Innsmouth']/child::localCount)"/>
      <xsl:variable name="otherWordsShadow" select="sum(descendant::word[descendant::w[@type='other']][descendant::work[title='The Shadow Over Innsmouth'][xs:integer(localCount) gt 0]]/descendant::work[title='The Shadow Over Innsmouth']/child::localCount)"/>
      <xsl:variable name="otherWordsShadowPerc" select="format-number(($otherWordsShadow div $totalWordsShadow) * 100,'#.##')"/>
      <xsl:variable name="totalWordsCall" select="sum(descendant::word[descendant::work[title='The Call of Cthulhu'][xs:integer(localCount) gt 0]]/descendant::work[title='The Call of Cthulhu']/child::localCount)"/>
      <xsl:variable name="otherWordsCall" select="sum(descendant::word[descendant::w[@type='other']][descendant::work[title='The Call of Cthulhu'][xs:integer(localCount) gt 0]]/descendant::work[title='The Call of Cthulhu']/child::localCount)"/>
      <xsl:variable name="totalWordsMtns" select="sum(descendant::word[descendant::work[title='At The Mountains of Madness'][xs:integer(localCount) gt 0]]/descendant::work[title='At The Mountains of Madness']/child::localCount)"/>
      <xsl:variable name="otherWordsMtns" select="sum(descendant::word[descendant::w[@type='other']][descendant::work[title='At The Mountains of Madness'][xs:integer(localCount) gt 0]]/descendant::work[title='At The Mountains of Madness']/child::localCount)"/>
      
      <xsl:template match="/">
            <xsl:comment>Total Words: <xsl:value-of select="$totalWords"/></xsl:comment>
            <xsl:comment>Total Marked Shadows Words: <xsl:value-of select="$totalWordsShadow"/></xsl:comment>
            <xsl:comment>Marked Shadows Other Words: <xsl:value-of select="$otherWordsShadow"/></xsl:comment>
            <xsl:comment>Marked Shadows Other Words Percent: <xsl:value-of select="$otherWordsShadowPerc"/></xsl:comment>
            
            <xsl:comment>Total Marked Call Words: <xsl:value-of select="$totalWordsCall"/></xsl:comment>
            <xsl:comment>Marked Call Other Words: <xsl:value-of select="$otherWordsCall"/></xsl:comment>
            
            <xsl:comment>Total Marked Mtns Words: <xsl:value-of select="$totalWordsMtns"/></xsl:comment>
            <xsl:comment>Marked Mtns Other Words: <xsl:value-of select="$otherWordsMtns"/></xsl:comment>
            

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
