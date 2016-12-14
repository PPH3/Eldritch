<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://eldritch.code.newtfire.org"
    xmlns="http://eldritch.code.newtfire.org"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:output method="xml" indent="yes"/> 
    <!--2016-12-13 ebb: Run this ID transform to read from the full word list XML file drawn from the collection to patch in the synset info pulled from WordNet.-->
    <xsl:variable name="synset" select="document('synset_info_lc.xml')"/>
    <xsl:mode on-no-match="shallow-copy"/>
    <xsl:template match="w">
        <w type="{@type}"><xsl:apply-templates/></w>
        <xsl:apply-templates select="$synset//word[w = current()]//synsetCount"/>
        <xsl:apply-templates select="$synset//word[w = current()]//synset"/>
    </xsl:template>
</xsl:stylesheet>