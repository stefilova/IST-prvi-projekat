<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">

<xsl:template match="Adresar">
    <html>
        <head>
            <title>HTML dokument sa tabelom koja prikazuje sve podatke o Osobama i Kompanijamakoje sadrže više od dve email adrese</title>
        </head>
        <body>
            <table border="2px">
            <thead>
                <tr bgcolor="Blue">
                    <td colspan="14"><h1 style="color:#fff; text-align: center;">Osobe</h1></td>
                </tr>
                <tr>
                    <td colspan="3">Ime</td>
                    <td colspan="3">Datum rodjenja</td>
                    <td colspan="4">Adresa</td>
                    <td rowspan="2" colspan="2">Telefon</td>
                    <td rowspan="2" colspan="2">Email adresa</td>
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
    </html>
</xsl:template>
<xsl:template match="Osoba">
            <xsl:if test="count(Email) &gt; 2">
            <tr>
                <td>
                <xsl:value-of select="PunoIme/Ime"/>
                </td>
                <td>
                <xsl:value-of select="PunoIme/SrednjeIme"/>
                </td>
                <td>
                <xsl:value-of select="PunoIme/Prezime"/>
                </td>
            </tr>
            </xsl:if>
        </xsl:template>
</xsl:stylesheet>