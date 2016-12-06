<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output method="text" indent="yes"/>
    
    <xsl:variable name="love" select="collection('../mark-up')"/>
    <xsl:variable name="numWord" select="distinct-values($love//w/normalize-space())"/>
    <xsl:variable name="countWord" select="count($numWord)"/>
    
    
    <xsl:template match="/">
  
        
            <xsl:for-each select="$numWord">
                <xsl:sort/>
                
                <xsl:value-of select="concat(., '&#x0a;')"/>

        </xsl:for-each>
     
    </xsl:template>
</xsl:stylesheet>