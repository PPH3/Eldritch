<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:variable name="love" select="collection('../mark-up')"/>
    <xsl:variable name="numWord" select="distinct-values($love//w/normalize-space())"/>
    <xsl:variable name="countWord" select="count($numWord)"/>
    <xsl:variable name="titleColl" select="$love//titleStmt/title"/>
    
    <xsl:template match="/">
      <xml> <listAlph>
        <xsl:comment>
            Distinct-values count: <xsl:value-of select="$countWord"/>
        </xsl:comment>
        
            <xsl:for-each select="$numWord">
                <xsl:sort/>
                <xsl:variable name="currWord" select="current()"/>
                <word>
                    <w><xsl:value-of select="."/></w>
                    <lovecraftUse>
                        
                 <totalCount><xsl:value-of select="count($love//w[. = current()])"/></totalCount>
                        <xsl:for-each select="$titleColl">
                            <xsl:comment>Current word is <xsl:value-of select="$currWord"/></xsl:comment>
                            <work><title><xsl:value-of select="."/></title>
                                <localCount><xsl:value-of select="count(ancestor::TEI//text//w[. = $currWord])"/></localCount>
                                
                            </work>
                            
                        </xsl:for-each>
                    </lovecraftUse>
                    
                    
                </word>
                
<!--                
                <listNum>
                    <xsl:value-of select="."/>(<xsl:value-of select="count(.)"/>)
                </listNum>-->
        </xsl:for-each>
       </listAlph>
        
        <listCount>
            <xsl:comment>
            Distinct-values count: <xsl:value-of select="$countWord"/>
        </xsl:comment>
            
            <xsl:for-each select="$numWord">
                
                <xsl:sort select="count($love//w[. = current()])" order="descending"/>
                <xsl:variable name="currentWord" select="current()"/>
              
                <word>
                    <w><xsl:value-of select="."/></w>
                    <lovecraftUse>
                        
                        <totalCount><xsl:value-of select="count($love//w[. = current()])"/></totalCount>
                        
                            
                 <xsl:for-each select="$titleColl">
                    <xsl:comment>Current word is <xsl:value-of select="$currentWord"/></xsl:comment>
                               <work><title><xsl:value-of select="."/></title>
                            <localCount><xsl:value-of select="count(ancestor::TEI//text//w[. = $currentWord])"/></localCount>
                           
                        </work>
                                
                            </xsl:for-each>
                        
                        
                    </lovecraftUse>
                    
                    
                </word>
                
                <!--                
                <listNum>
                    <xsl:value-of select="."/>(<xsl:value-of select="count(.)"/>)
                </listNum>-->
            </xsl:for-each>
        </listCount>
      </xml>
    </xsl:template>
</xsl:stylesheet>