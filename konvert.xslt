<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">

<xsl:output method="xml" indent="yes"/>

  <xsl:template match="Adresar">
    <Adresar>
      <xsl:apply-templates select="Osoba"/>
      <xsl:apply-templates select="Kompanija"/>
    </Adresar>
  </xsl:template>

  <xsl:template match="Adresa">
    <Adresa>
      <xsl:for-each select="*">
        <xsl:if test="not(local-name() = 'Drzava')">
          <xsl:attribute name="{name()}">
            <xsl:value-of select="text()"/>
          </xsl:attribute>
        </xsl:if>
      </xsl:for-each>
      <xsl:if test="boolean(Drzava)">
        <Drzava>
          <xsl:value-of select="Drzava"/>
        </Drzava>
      </xsl:if>
    </Adresa>
  </xsl:template>

  <xsl:template match="Osoba">
    <Osoba>
      <PunoIme>
        <Ime>
          <xsl:value-of select="PunoIme/Ime"/>
        </Ime>
        <xsl:if test="boolean(PunoIme/SrednjeIme)">
          <SrednjeIme>
            <xsl:value-of select="PunoIme/SrednjeIme"/>
          </SrednjeIme>
        </xsl:if>
        <xsl:for-each select="PunoIme/Prezime">
          <Prezime>
            <xsl:value-of select="."/>
          </Prezime>
        </xsl:for-each>
      </PunoIme>
      <DatumRodjenja>
        <Dan>
          <xsl:value-of select="DatumRodjenja/Dan"/>
        </Dan>
        <Mesec>
          <xsl:value-of select="DatumRodjenja/Mesec"/>
        </Mesec>
        <Godina>
          <xsl:value-of select="DatumRodjenja/Godina"/>
        </Godina>
      </DatumRodjenja>
      <xsl:apply-templates select="Adresa"/>
      <Telefon>
        <xsl:value-of select="Telefon"/>
      </Telefon>
      <xsl:for-each select="Email">
        <Email>
          <xsl:value-of select="."/>
        </Email>
      </xsl:for-each>
    </Osoba>
  </xsl:template>

  <xsl:template match="Kompanija">
    <Kompanija>
      <Naziv>
        <xsl:value-of select="Naziv"/>
      </Naziv>
      <xsl:apply-templates select="Adresa"/>
      <Telefon>
        <xsl:value-of select="Telefon"/>
      </Telefon>
      <xsl:for-each select="Email">
        <Email>
          <xsl:value-of select="."/>
        </Email>
      </xsl:for-each>
    </Kompanija>
  </xsl:template>
</xsl:stylesheet>