<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output method="xml" indent="yes"/>
 <!--2016-12-13 ebb: This XSLT pulls words from the collection, and lower-cases them and takes distinct-values, and outputs the basic structure of the project's Index of Words, with total counts. 
     The output of this file will NOT include synset information, since we need to map that back onto it after running Python over WordNet.  -->   
    <xsl:variable name="love" select="collection('../mark-up')"/>
    <xsl:variable name="numWord" select="distinct-values($love//w/lower-case(normalize-space()))"/>
    <xsl:variable name="countWord" select="count($numWord)"/>
    <xsl:variable name="titleColl" select="$love//titleStmt/title"/>
    
    <xsl:template match="/">
      <xml> <list>
        <xsl:comment>
            Distinct-values count: <xsl:value-of select="$countWord"/>
        </xsl:comment>
        
            <xsl:for-each select="$numWord">
                <xsl:sort/>
               <!--Uncomment this to output a list based on count. 
    <xsl:sort select="count($love//w[. = current()])" order="descending"/>-->
                <xsl:variable name="currWord" select="current()"/>
              
                <word>
                    <w><xsl:value-of select="$currWord"/></w>
                    <lovecraftUse>
                        
                 <totalCount><xsl:value-of select="count($love//w[lower-case(.) = current()])"/></totalCount>
                        <xsl:for-each select="$titleColl">
                            <work><title><xsl:value-of select="."/></title>
                                <localCount><xsl:value-of select="count(ancestor::TEI//text//w[lower-case(.) = $currWord])"/></localCount>
                                
                            </work>
                            
                        </xsl:for-each>
                    </lovecraftUse>
                    
                    
                </word>
                

        </xsl:for-each>
       </list>
        
       
      </xml>
    </xsl:template>
</xsl:stylesheet>