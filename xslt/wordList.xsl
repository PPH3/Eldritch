<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:variable name="love" select="collection('../mark-up')"/>
    <xsl:variable name="numWord" select="distinct-values($love//w)"/>
    <xsl:variable name="countWord" select="count($numWord)"/>
    
    
    <xsl:template match="/">
        <xsl:comment>
            Distinct-values count: <xsl:value-of select="$countWord"/>
        </xsl:comment>
        
        <list>
            <xsl:for-each select="$numWord">
            <xsl:sort/>
                <word>
                    <w><xsl:value-of select="."/></w>
                </word>
        </xsl:for-each>
        </list>
    </xsl:template>
</xsl:stylesheet>