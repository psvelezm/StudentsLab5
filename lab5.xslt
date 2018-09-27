<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>CS Majors</title>
      </head>
      <body>
        <h2>Computer Science Majors</h2>
        <xsl:apply-templates select="students/student[major='CS:BS']"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="student">
    <xsl:apply-templates select="id"/>
    <xsl:apply-templates select="lastName"/>
    <xsl:apply-templates select="firstName"/>
    <xsl:apply-templates select="dateEnrolled"/>
    <xsl:apply-templates select="major"/>
    <p/>
  </xsl:template>

  <xsl:template match="id">
    ID =
    <xsl:value-of select="."/>
    <br/>
  </xsl:template>

  <xsl:template match="lastName">
    Name =
    <xsl:value-of select="."/>,
  </xsl:template>

  <xsl:template match="firstName">
    <xsl:value-of select="."/>
    <br />
  </xsl:template>

  <xsl:template match="dateEnrolled">
    Date-enrolled:
    <xsl:value-of select="."/>
    <br />
  </xsl:template>

  <xsl:template match="major[.='CS:BS']">
    Major =
    <xsl:value-of select="."/>, declared in <xsl:value-of select="@catalogYear"/>
    <xsl:if test="self::node()[@catalogYear>2008]">
      <div style="color: red">
        Must complete the Senior Project course.
      </div>
    </xsl:if>
  </xsl:template>



</xsl:stylesheet>