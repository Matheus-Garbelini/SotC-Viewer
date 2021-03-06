<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!--  <xsl:output method="html"/> -->
<xsl:output method="html" version="4.0" encoding="iso-8859-1" indent="no"/>

<!-- ========================================================================== -->
<!-- Root info -->
<!-- ========================================================================== -->

<xsl:template match="GLINTERCEPT">
  <html>
  <xsl:apply-templates select="HEADER"/>
  <xsl:apply-templates select="FUNCTIONS"/>
  </html>
</xsl:template>

<!-- ========================================================================== -->
<!-- Header info -->
<!-- ========================================================================== -->

<xsl:template match="HEADER">
  <head>
  <META http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>GL Intercept version <xsl:apply-templates select="VERSION"/> Run on <xsl:apply-templates select="TIMESTAMP"/></title>

  <SCRIPT language="JavaScript1.2" src="main15.js" type="text/javascript">
  /*
  Pleas leave this notice.
  DHTML tip message version 1.5 copyright Essam Gamal 2003.
  Home Pag: http://migoicons.tripod.com
  Email migoicons@hotmail.com
  Script featured on and can be found at Dynamic Drive (http://www.dynamicdrive.com)
  */ 
  </SCRIPT>   
  </head>
</xsl:template>

<xsl:template match="VERSION">
 <xsl:apply-templates/>
</xsl:template>

<xsl:template match="TIMESTAMP">
 <xsl:apply-templates/>
</xsl:template>

<!-- ========================================================================== -->
<!-- Function info -->
<!-- ========================================================================== -->
<xsl:template match="FUNCTIONS">
  <body>
  
  <DIV id="tiplayer" style="visibility:hidden;position:absolute;z-index:1000;top:-100;"></DIV>

  <SCRIPT language="JavaScript1.2" >

    var TipId="tiplayer"
    var FiltersEnabled = 1

    Style[0]=["white","","","","",,"black","#ffffcc","","","",,,,2,"#b22222",2,24,0.5,0,2,"gray",,1,,13]
    Style[3]=["","","","","",,"","","","","",,,,,"",,,,,,"",1,,,]

    mig_clay()

  </SCRIPT>

  <xsl:apply-templates select="FUNCTION"/>
  
  </body>
</xsl:template>

<!-- Main function template -->
<xsl:template name="MainFunction">
  <xsl:apply-templates select="NAME"/>

  <!-- If this function has no parameters- it is unknown -->
  (<xsl:choose>
   <xsl:when test="count(child::PARAM) > 0">
     <xsl:apply-templates select="PARAM"/>
   </xsl:when>

   <xsl:otherwise>???</xsl:otherwise>
  </xsl:choose>)

  <!-- Apply the return code -->
  <xsl:apply-templates select="RETURN"/>

  <!-- Apply any error codes -->
  <xsl:apply-templates select="ERROR"/>

  <!-- Recursive call -->
  <xsl:apply-templates select="FUNCTION"/>
</xsl:template>

 <!-- Single function -->
<xsl:template match="FUNCTIONS/FUNCTION">
  <br/><xsl:call-template name="MainFunction"/>
</xsl:template>

<!-- Function called from a function -->
<xsl:template match="FUNCTION/FUNCTION">
  <br/><b><xsl:text>-----> </xsl:text></b><xsl:call-template name="MainFunction"/>
</xsl:template>

<xsl:template match="NAME">
 <xsl:apply-templates/>
</xsl:template>

<!-- ========================================================================== -->
<!-- Parameter processing -->
<!-- ========================================================================== -->

<xsl:template match="PARAM">
 
 <!-- Use a on-mouse over for parameter name and type -->
 <a onMouseOver="stm([&quot;Name={@name}&quot;,&quot;Type={@type}&quot;],Style[3])" onMouseOut="htm()">

 <!-- Choose between an array of values and 1 value -->
 <xsl:choose>
   <xsl:when test="count(child::VALUE) = 1">
     <xsl:apply-templates/>
   </xsl:when>

   <xsl:when test="count(child::VALUE) > 1">
     [<xsl:apply-templates/>]
   </xsl:when>
 </xsl:choose>
 
 </a>

 <!-- Add a comma -->
 <xsl:if test="position() != last()">,</xsl:if>

</xsl:template>

<xsl:template match="VALUE">

 <!-- Select the data -->
 <xsl:value-of select="@data"/>

 <!-- Add a comma -->
 <xsl:if test="position() != last()">,</xsl:if>
</xsl:template>


<!-- ========================================================================== -->
<!-- Return processing -->
<!-- ========================================================================== -->

<xsl:template match="RETURN">
 = <xsl:apply-templates select="VALUE"/> 
</xsl:template>


<!-- ========================================================================== -->
<!-- Error processing -->
<!-- ========================================================================== -->

<xsl:template match="ERROR">
 glGetError() = <xsl:apply-templates select="VALUE"/> 
</xsl:template>

</xsl:stylesheet>
