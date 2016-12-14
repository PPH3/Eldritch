<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:output method="xml" indent="yes"/> 
    <xsl:variable name="fullList" select="document('fullList_syn.xml')"/>
<!--    <xsl:variable name="synset" select="document('synset_info.xml')"/>-->
    <xsl:mode on-no-match="shallow-copy"/>
    <xsl:template match="word[lower-case(.) = following::w or lower-case(.) = preceding::w]">
     <w type="{w/@type}"> <xsl:value-of select="lower-case(w)"/></w>
        <totalCount><xsl:value-of select="totalCount/number() + preceding::w[. = current()]/totalCount/number() + following::w[. = current()]/totalCount/number()"/></totalCount>
        
    </xsl:template>
</xsl:stylesheet>