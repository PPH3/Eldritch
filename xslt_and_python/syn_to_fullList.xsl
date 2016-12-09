<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="synset" select="document('synset_info.xml')"/>
    <xsl:mode on-no-match="shallow-copy"/>
    <xsl:template match="w">
        <w><xsl:apply-templates/></w>
        <xsl:apply-templates select="$synset//word[w=current()]//synsetCount"/>
    </xsl:template>
</xsl:stylesheet>