<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
      xmlns:xs="http://www.w3.org/2001/XMLSchema"
      xpath-default-namespace="http://eldritch.code.newtfire.org"
      exclude-result-prefixes="xs"
      xmlns="http://www.w3.org/2000/svg">
      <xsl:output method="xml" indent="yes"/>
      <!--2016-12-14 ebb: Note that this function should be used ONLY for labels, not for calculating lengths of bars: 
            format-number(($relWordsShadow div $totalWordsShadow) * 100,'##') -->
      <!--GLOBAL VARIABLES-->
      <xsl:variable name="synsetFile" select="document('fullList_syn.xml')"/>
      <xsl:variable name="totalWords" select="sum(descendant::word//totalCount)"/>
      <!--SHADOW VARIABLES-->
      <xsl:variable name="totalWordsShadow" select="sum(descendant::word[descendant::work[title='The Shadow Over Innsmouth'][number(localCount) gt 0]]/descendant::work[title='The Shadow Over Innsmouth']/child::localCount)"/>
      <xsl:variable name="otherWordsShadow" select="sum(descendant::word[descendant::w[@type='other']][descendant::work[title='The Shadow Over Innsmouth'][number(localCount) gt 0]]/descendant::work[title='The Shadow Over Innsmouth']/child::localCount)"/>
      <xsl:variable name="otherWordsShadowPerc" select="$otherWordsShadow div $totalWordsShadow * 100"/>
      <xsl:variable name="relWordsShadow" select="sum(descendant::word[descendant::w[@type='religious']][descendant::work[title='The Shadow Over Innsmouth'][number(localCount) gt 0]]/descendant::work[title='The Shadow Over Innsmouth']/child::localCount)"/>
      <xsl:variable name="relWordsShadowPerc" select="($relWordsShadow div $totalWordsShadow) * 100"/>
      <xsl:variable name="sciWordsShadow" select="sum(descendant::word[descendant::w[@type='scientific']][descendant::work[title='The Shadow Over Innsmouth'][number(localCount) gt 0]]/descendant::work[title='The Shadow Over Innsmouth']/child::localCount)"/>
      <xsl:variable name="sciWordsShadowPerc" select="($sciWordsShadow div $totalWordsShadow) * 100"/>
      <xsl:variable name="gothWordsShadow" select="sum(descendant::word[descendant::w[@type='gothic']][descendant::work[title='The Shadow Over Innsmouth'][number(localCount) gt 0]]/descendant::work[title='The Shadow Over Innsmouth']/child::localCount)"/>
      <xsl:variable name="gothWordsShadowPerc" select="($gothWordsShadow div $totalWordsShadow) * 100"/>
      <!--CALL VARIABLES-->
      <xsl:variable name="totalWordsCall" select="sum(descendant::word[descendant::work[title='The Call of Cthulhu'][number(localCount) gt 0]]/descendant::work[title='The Call of Cthulhu']/child::localCount)"/>
      <xsl:variable name="otherWordsCall" select="sum(descendant::word[descendant::w[@type='other']][descendant::work[title='The Call of Cthulhu'][number(localCount) gt 0]]/descendant::work[title='The Call of Cthulhu']/child::localCount)"/>
      <xsl:variable name="otherWordsCallPerc" select="($otherWordsCall div $totalWordsCall) * 100"/>
      <xsl:variable name="gothWordsCall" select="sum(descendant::word[descendant::w[@type='gothic']][descendant::work[title='The Call of Cthulhu'][number(localCount) gt 0]]/descendant::work[title='The Call of Cthulhu']/child::localCount)"/>
      <xsl:variable name="gothWordsCallPerc" select="($gothWordsCall div $totalWordsCall) * 100"/>
      <xsl:variable name="sciWordsCall" select="sum(descendant::word[descendant::w[@type='scientific']][descendant::work[title='The Call of Cthulhu'][number(localCount) gt 0]]/descendant::work[title='The Call of Cthulhu']/child::localCount)"/>
      <xsl:variable name="sciWordsCallPerc" select="($sciWordsCall div $totalWordsCall) * 100"/>
      <xsl:variable name="relWordsCall" select="sum(descendant::word[descendant::w[@type='religious']][descendant::work[title='The Call of Cthulhu'][number(localCount) gt 0]]/descendant::work[title='The Call of Cthulhu']/child::localCount)"/>
      <xsl:variable name="relWordsCallPerc" select="($relWordsCall div $totalWordsCall) * 100"/>
     <!--MOUNTAINS VARIABLES-->
      <xsl:variable name="totalWordsMtns" select="sum(descendant::word[descendant::work[title='At The Mountains of Madness'][number(localCount) gt 0]]/descendant::work[title='At The Mountains of Madness']/child::localCount)"/>
      <xsl:variable name="otherWordsMtns" select="sum(descendant::word[descendant::w[@type='other']][descendant::work[title='At The Mountains of Madness'][number(localCount) gt 0]]/descendant::work[title='At The Mountains of Madness']/child::localCount)"/>
      <xsl:variable name="otherWordsMtnsPerc" select="($otherWordsMtns div $totalWordsMtns) * 100"/>
      <xsl:variable name="relWordsMtns" select="sum(descendant::word[descendant::w[@type='religious']][descendant::work[title='At The Mountains of Madness'][number(localCount) gt 0]]/descendant::work[title='At The Mountains of Madness']/child::localCount)"/>
      <xsl:variable name="relWordsMtnsPerc" select="($relWordsMtns div $totalWordsMtns) * 100"/>
      <xsl:variable name="sciWordsMtns" select="sum(descendant::word[descendant::w[@type='scientific']][descendant::work[title='At The Mountains of Madness'][number(localCount) gt 0]]/descendant::work[title='At The Mountains of Madness']/child::localCount)"/>
      <xsl:variable name="sciWordsMtnsPerc" select="($sciWordsMtns div $totalWordsMtns) * 100"/>
      <xsl:variable name="gothWordsMtns" select="sum(descendant::word[descendant::w[@type='gothic']][descendant::work[title='At The Mountains of Madness'][number(localCount) gt 0]]/descendant::work[title='At The Mountains of Madness']/child::localCount)"/>
      <xsl:variable name="gothWordsMtnsPerc" select="($gothWordsMtns div $totalWordsMtns) * 100"/>
      <xsl:variable name="ySpacer" select="5"/>
      <xsl:variable name="xSpacer" select="10"/>
     
      <xsl:template match="/">
            <xsl:comment>Total Words: <xsl:value-of select="$totalWords"/></xsl:comment>
            <xsl:comment>Total Marked Shadows Words: <xsl:value-of select="$totalWordsShadow"/></xsl:comment>
            <xsl:comment>Marked Shadows Other Words: <xsl:value-of select="$otherWordsShadow"/></xsl:comment>
            <xsl:comment>Marked Shadows Other Words Percent: <xsl:value-of select="$otherWordsShadowPerc"/></xsl:comment>
            <xsl:comment>Marked Shadows Religious Words: <xsl:value-of select="$relWordsShadow"/></xsl:comment>
            <xsl:comment>Marked Shadows Religious Words Percent: <xsl:value-of select="$relWordsShadowPerc"/></xsl:comment>
            <xsl:comment>Marked Shadows Scientific Words: <xsl:value-of select="$sciWordsShadow"/></xsl:comment>
            <xsl:comment>Marked Shadows Scientific Words Percent: <xsl:value-of select="$sciWordsShadowPerc"/></xsl:comment>
            <xsl:comment>Marked Shadows Gothic Words: <xsl:value-of select="$gothWordsShadow"/></xsl:comment>
            <xsl:comment>Marked Shadows Gothic Words Percent: <xsl:value-of select="$gothWordsShadowPerc"/></xsl:comment>
            
            <xsl:comment>Total Marked Call Words: <xsl:value-of select="$totalWordsCall"/></xsl:comment>
            <xsl:comment>Marked Call Other Words: <xsl:value-of select="$otherWordsCall"/></xsl:comment>
            <xsl:comment>Marked Call Other Words: <xsl:value-of select="$otherWordsCallPerc"/></xsl:comment>
            <xsl:comment>Marked Call Religious Words: <xsl:value-of select="$relWordsCall"/></xsl:comment>
            <xsl:comment>Marked Call Religious Words Percent: <xsl:value-of select="$relWordsCallPerc"/></xsl:comment>
            <xsl:comment>Marked Call Scientific Words: <xsl:value-of select="$sciWordsCall"/></xsl:comment>
            <xsl:comment>Marked Call Scientific Words Percent: <xsl:value-of select="$sciWordsCallPerc"/></xsl:comment>
            <xsl:comment>Marked Call Gothic Words: <xsl:value-of select="$gothWordsCall"/></xsl:comment>
            <xsl:comment>Marked Call Gothic Words Percent: <xsl:value-of select="$gothWordsCallPerc"/></xsl:comment>
            
            <xsl:comment>Total Marked Mtns Words: <xsl:value-of select="$totalWordsMtns"/></xsl:comment>
            <xsl:comment>Marked Mtns Other Words: <xsl:value-of select="$otherWordsMtns"/></xsl:comment>
            <xsl:comment>Marked Mtns Other Words Percent: <xsl:value-of select="$otherWordsMtnsPerc"/></xsl:comment>
            <xsl:comment>Marked Mtns Religious Words: <xsl:value-of select="$relWordsMtns"/></xsl:comment>
            <xsl:comment>Marked Mtns Religious Words Percent: <xsl:value-of select="$relWordsMtnsPerc"/></xsl:comment>
            <xsl:comment>Marked Mtns Scientific Words: <xsl:value-of select="$sciWordsMtns"/></xsl:comment>
            <xsl:comment>Marked Mtns Scientific Words Percent: <xsl:value-of select="$sciWordsMtnsPerc"/></xsl:comment>
            <xsl:comment>Marked Mtns Gothic Words: <xsl:value-of select="$gothWordsMtns"/></xsl:comment>
            <xsl:comment>Marked Mtns Gothic Words Percent: <xsl:value-of select="$gothWordsMtnsPerc"/></xsl:comment>

            <svg width="100%" height="100%" viewBox="0 0 1700 800">
                  <g transform="translate(100 570)">
                        <!--AXIS-->
                        <line x1="0" x2="{70 * $xSpacer}" y1="0" y2="0" stroke="black" stroke-width="5"/>
                        <line x1="0" x2="0" y1="0" y2="-{100 * $ySpacer}" stroke="black" stroke-width="5"/>
                        
                        <!--x HASHES AND BARS CUZ FUCK ORGANIZATION-->
                        <xsl:for-each select="1 to 3">
                              <xsl:if test="current() = 1">
                                    <!--Other Line--><line x1="{current() * 20 * $xSpacer}" x2="{current() * 20 * $xSpacer}" y1="0" y2="-{$otherWordsMtnsPerc * $ySpacer}" stroke="#323021" stroke-width="70"/>
                                    <text x="{current() * 20 * $xSpacer}" y="-85" text-anchor="middle" stroke="#d80ed8"><xsl:value-of select="$otherWordsMtnsPerc"/><xsl:text>%</xsl:text></text>
                                    <!--Scientific Line--><line x1="{current() * 20 * $xSpacer}" x2="{current() * 20 * $xSpacer}" y1="-{$otherWordsMtnsPerc * $ySpacer}" y2="-{($sciWordsMtnsPerc + $otherWordsMtnsPerc) * $ySpacer}" stroke="#5e846d" stroke-width="70"/>
                                    <text x="{current() * 20 * $xSpacer}" y="-258" text-anchor="middle" stroke="#d80ed8"><xsl:value-of select="$sciWordsMtnsPerc"/><xsl:text>%</xsl:text></text>
                                    <!--Religious Line--><line x1="{current() * 20 * $xSpacer}" x2="{current() * 20 * $xSpacer}" y1="-{($sciWordsMtnsPerc + $otherWordsMtnsPerc) * $ySpacer}" y2="-{($sciWordsMtnsPerc + $otherWordsMtnsPerc + $relWordsMtnsPerc) * $ySpacer}" stroke="#98a2a1" stroke-width="70"/>
                                    <text x="{current() * 20 * $xSpacer}" y="-393" text-anchor="middle" stroke="#d80ed8"><xsl:value-of select="$gothWordsMtnsPerc"/><xsl:text>%</xsl:text></text>
                                    <!--Gothic Line--><line x1="{current() * 20 * $xSpacer}" x2="{current() * 20 * $xSpacer}" y1="-{($sciWordsMtnsPerc + $otherWordsMtnsPerc + $relWordsMtnsPerc) * $ySpacer}" y2="-{($sciWordsMtnsPerc + $otherWordsMtnsPerc + $relWordsMtnsPerc + $gothWordsMtnsPerc) * $ySpacer}" stroke="#bdcfc6" stroke-width="70"/>
                                    <text x="{current() * 20 * $xSpacer}" y="-460" text-anchor="middle" stroke="#d80ed8"><xsl:value-of select="$gothWordsMtnsPerc"/><xsl:text>%</xsl:text></text>
                                    <text x="{current() * 20  * $xSpacer}" y="10" font-size="23" text-anchor="end" transform="rotate(-45 {current() * 20  * $xSpacer}, 15)">At The Mountains of Madness</text>
                              </xsl:if>
                              <xsl:if test="current() = 2">
                                    <!--Other Line--><line x1="{current() * 20 * $xSpacer}" x2="{current() * 20 * $xSpacer}" y1="0" y2="-{$otherWordsCallPerc * $ySpacer}" stroke="#323021" stroke-width="70"/>
                                    <text x="{current() * 20 * $xSpacer}" y="-80" text-anchor="middle" stroke="#d80ed8"><xsl:value-of select="$otherWordsCallPerc"/><xsl:text>%</xsl:text></text>
                                    <!--Scientific Line--><line x1="{current() * 20 * $xSpacer}" x2="{current() * 20 * $xSpacer}" y1="-{$otherWordsCallPerc * $ySpacer}" y2="-{($sciWordsCallPerc + $otherWordsCallPerc) * $ySpacer}" stroke="#5e846d" stroke-width="70"/>
                                    <text x="{current() * 20 * $xSpacer}" y="-200" text-anchor="middle" stroke="#d80ed8"><xsl:value-of select="$sciWordsCallPerc"/><xsl:text>%</xsl:text></text>
                                    <!--Religious Line--><line x1="{current() * 20 * $xSpacer}" x2="{current() * 20 * $xSpacer}" y1="-{($sciWordsCallPerc + $otherWordsCallPerc) * $ySpacer}" y2="-{($sciWordsCallPerc + $otherWordsCallPerc + $relWordsCallPerc) * $ySpacer}" stroke="#98a2a1" stroke-width="70"/>
                                    <text x="{current() * 20 * $xSpacer}" y="-330" text-anchor="middle" stroke="#d80ed8"><xsl:value-of select="$relWordsCallPerc"/><xsl:text>%</xsl:text></text>
                                    <!--Gothic Line--><line x1="{current() * 20 * $xSpacer}" x2="{current() * 20 * $xSpacer}" y1="-{($sciWordsCallPerc + $otherWordsCallPerc + $relWordsCallPerc) * $ySpacer}" y2="-{($sciWordsCallPerc + $otherWordsCallPerc + $relWordsCallPerc + $gothWordsCallPerc) * $ySpacer}" stroke="#bdcfc6" stroke-width="70"/>
                                    <text x="{current() * 20  * $xSpacer}" y="10" font-size="23" text-anchor="end" transform="rotate(-45 {current() * 20  * $xSpacer}, 15)">The Call of Cthulhu</text>
                                    <text x="{current() * 20 * $xSpacer}" y="-450" text-anchor="middle" stroke="#d80ed8"><xsl:value-of select="$gothWordsCallPerc"/><xsl:text>%</xsl:text></text>
                              </xsl:if>
                              <xsl:if test="current() = 3">
                                    <!--Other Line--><line x1="{current() * 20 * $xSpacer}" x2="{current() * 20 * $xSpacer}" y1="0" y2="-{$otherWordsShadowPerc * $ySpacer}" stroke="#323021" stroke-width="70"/>
                                    <text x="{current() * 20 * $xSpacer}" y="-65" text-anchor="middle" stroke="#d80ed8"><xsl:value-of select="$otherWordsShadowPerc"/><xsl:text>%</xsl:text></text>
                                    <!--Scientific Line--><line x1="{current() * 20 * $xSpacer}" x2="{current() * 20 * $xSpacer}" y1="-{$otherWordsShadowPerc * $ySpacer}" y2="-{($sciWordsShadowPerc + $otherWordsShadowPerc) * $ySpacer}" stroke="#5e846d" stroke-width="70"/>
                                    <text x="{current() * 20 * $xSpacer}" y="-152" text-anchor="middle" stroke="#d80ed8"><xsl:value-of select="$sciWordsShadowPerc"/><xsl:text>%</xsl:text></text>
                                    <!--Religious Line--><line x1="{current() * 20 * $xSpacer}" x2="{current() * 20 * $xSpacer}" y1="-{($sciWordsShadowPerc + $otherWordsShadowPerc) * $ySpacer}" y2="-{($sciWordsShadowPerc + $otherWordsShadowPerc + $relWordsShadowPerc) * $ySpacer}" stroke="#98a2a1" stroke-width="70"/>
                                    <text x="{current() * 20 * $xSpacer}" y="-222" text-anchor="middle" stroke="#d80ed8"><xsl:value-of select="$relWordsShadowPerc"/><xsl:text>%</xsl:text></text>
                                    <!--Gothic Line--><line x1="{current() * 20 * $xSpacer}" x2="{current() * 20 * $xSpacer}" y1="-{($sciWordsShadowPerc + $otherWordsShadowPerc + $relWordsShadowPerc) * $ySpacer}" y2="-{($sciWordsShadowPerc + $otherWordsShadowPerc + $relWordsShadowPerc + $gothWordsShadowPerc) * $ySpacer}" stroke="#bdcfc6" stroke-width="70"/>
                                    <text x="{current() * 20 * $xSpacer}" y="-380" text-anchor="middle" stroke="#d80ed8"><xsl:value-of select="$gothWordsShadowPerc"/><xsl:text>%</xsl:text></text>
                                    <text x="{current() * 20  * $xSpacer}" y="10" font-size="23" text-anchor="end" transform="rotate(-45 {current() * 20  * $xSpacer}, 15)">The Shadow Over Innsmouth</text>
                              </xsl:if>
                        </xsl:for-each>
                        <!--Y HASHES-->
                        <xsl:for-each select="1 to 4">
                              <xsl:if test="current() = 1">
                                    <text x="-20" y="-{current() * 25 * $ySpacer}" font-size="15" text-anchor="middle">25%</text>
                              </xsl:if>
                              <xsl:if test="current() = 2">
                                    <text x="-20" y="-{current() * 25  * $ySpacer}" font-size="15" text-anchor="middle">50%</text>
                              </xsl:if>
                              <xsl:if test="current() = 3">
                                    <text x="-20" y="-{current() * 25  * $ySpacer}" font-size="15" text-anchor="middle">75%</text>
                              </xsl:if>
                              <xsl:if test="current() = 4">
                                    <text x="-20" y="-{current() * 25  * $ySpacer}" font-size="15" text-anchor="middle">100%</text>
                              </xsl:if>
                              <line x1="0" x2="{70*$xSpacer}" y1="-{current() * 25  * $ySpacer}" y2="-{current() * 25  * $ySpacer}" stroke="black" stroke-width="1" stroke-dasharray="5"/>
                        </xsl:for-each>
                        
                        <!--KEY AND TITLE-->
                              <text x="805" y="-293" text-anchor="center" font-size="20px">Other</text>
                              <text x="805" y="-274" text-anchor="start" font-size="20px">Scientific</text>
                              <text x="805" y="-252" text-anchor="start" font-size="20px">Religious</text>
                              <text x="805" y="-230" text-anchor="start" font-size="20px">Gothic</text>
                              <text x="780" y="-330" text-anchor="start" font-size="20px">Key</text>
                        <line x1="780" x2="815" y1="-320" y2="-320" stroke="black" stroke-width="3"/>
                        <line x1="760" x2="790" y1="-300" y2="-300" stroke="#323021" stroke-width="20"/>
                        <line x1="760" x2="790" y1="-280" y2="-280" stroke="#5e846d" stroke-width="20"/>
                        <line x1="760" x2="790" y1="-260" y2="-260" stroke="#98a2a1" stroke-width="20"/>
                        <line x1="760" x2="790" y1="-240" y2="-240" stroke="#bdcfc6" stroke-width="20"/>
                        
                        <text x="-60" y="-250" text-anchor="middle" font-size="20pt" style="writing-mode: tb;">Percentage of Word Type</text>
                        <text x="331" y="-525" text-anchor="middle" font-size="30pt">Percentage of Word Types Per Text</text>
                  </g>
            </svg>
      </xsl:template>
</xsl:stylesheet>