<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:variable name="love" select="collection('../mark-up')"/>
    <xsl:variable name="numWord" select="distinct-values($love//w/normalize-space())"/>
    <xsl:variable name="countWord" select="count($numWord)"/>
    
    
    <xsl:template match="/">
       <listAlph>
        <xsl:comment>
            Distinct-values count: <xsl:value-of select="$countWord"/>
        </xsl:comment>
        
            <xsl:for-each select="$numWord">
            <xsl:sort/>
                
                <word>
                    <w><xsl:value-of select="."/></w>
                    <lovecraftUse>
                        
                 <totalCount><xsl:value-of select="count($love//w[. = current()])"/></totalCount>
                       <!-- <work><title>...</title>
                            <localCount>...</localCount>
                           
                        </work>-->
                    </lovecraftUse>
                    
                    
                </word>
                
<!--                
                <listNum>
                    <xsl:value-of select="."/>(<xsl:value-of select="count(.)"/>)
                </listNum>-->
        </xsl:for-each>
       </listAlph>
    </xsl:template>
</xsl:stylesheet>