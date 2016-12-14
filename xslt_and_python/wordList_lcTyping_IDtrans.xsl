<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:output method="xml" indent="yes"/> 
    <!--2016-12-13 ebb: Pipeline Stage 2: Identity transform to add @type attributes to lower-cased wordlist (wordLit_lowercase.xml) and re-create fullList_syn.xml-->
    
    <xsl:variable name="typedList" select="document('fullList_syn.xml')"/>
    <xsl:mode on-no-match="shallow-copy"/>
    <xsl:template match="w">
        <w type="{($typedList//w[lower-case(.) = current()])[1]/@type}"><xsl:apply-templates/></w>
    </xsl:template>
</xsl:stylesheet>