<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">

<xsl:template match="Adresar">
<html>
<head>
    <head>
    <title>
        HTML dokument sa tabelom koja prikazuje sve podatke o Osobama i Kompanijama
    </title>
    </head>
    <body>
       <table border="2px" style="text-align:center;">
         <thead>
            <tr  bgcolor="blue">    
                <td colspan="14">
                <h1 style="color:#fff;">Osobe</h1>
                </td>
            </tr>
         </thead>
         <thead>
         <tr>
            <th colspan="3">Ime</th>
            <th colspan="3">Datum rodjenja</th>
            <th colspan="4">Adresa</th>
            <th colspan="2" rowspan="2">Telefon</th>
            <th colspan="2" rowspan="2">Email</th>
        </tr>
        <tr>
              <th>Ime</th>
              <th>Srednje Ime</th>
              <th>Prezime</th>
              <th>Dan</th>
              <th>Mesec</th>
              <th>Godina</th>
              <th>Ulica</th>
              <th>Broj</th>
              <th>Grad</th>
              <th>Drzava</th>
        </tr>
         </thead>
         <tbody>
            <xsl:apply-templates select="Osoba"/>
         </tbody>
       </table>
    </body>
</head>
</html>
</xsl:template>

<xsl:template match="Osoba">
    <xsl:if test="(Adresa/@tip = 'stalna') and (DatumRodjenja/Godina &gt; 1989) and (DatumRodjenja/Godina &lt; 2006) and (starts-with(PunoIme/Prezime, 'M'))">
    <tr>
    <td>
    <xsl:value-of select="PunoIme/Ime"/>
    </td>
    <td>    
    <xsl:value-of select="PunoIme/Prezime"/>
    </td>
    <td>
    <xsl:value-of select="PunoIme/Prezime"/>
    </td>
    <td>
          <xsl:value-of select="DatumRodjenja/Dan"/>
        </td>
        <td>
          <xsl:value-of select="DatumRodjenja/Mesec"/>
        </td>
        <td>
          <xsl:value-of select="DatumRodjenja/Godina"/>
        </td>
        <td>
          <xsl:value-of select="Adresa/Ulica"/>
        </td>
        <td>
          <xsl:value-of select="Adresa/Broj"/>
        </td>
        <td>
          <xsl:value-of select="Adresa/Grad"/>
        </td>
         <td>
          <xsl:value-of select="Adresa/Drzava"/>
        </td>
         <td colspan="2">
          <xsl:value-of select="Telefon"/>
        </td>
        <td colspan="2">
          <xsl:for-each select="Email">
            <xsl:value-of select="."/>
            <br/>
          </xsl:for-each>
        </td>
    </tr>
    </xsl:if>
</xsl:template>
</xsl:stylesheet>