<!-- $Id: summary.xsl 1958 2009-11-16 03:28:50Z boudreat $ -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" indent="yes"/>
<xsl:decimal-format decimal-separator="." grouping-separator="," />
<xsl:template match="contestStandings">
    <HTML>
        <HEAD>
<TITLE>
Summary - <xsl:value-of select="/contestStandings/standingsHeader/@title"/>
</TITLE>
<META HTTP-EQUIV="EXPIRES" CONTENT="0"/>
<META HTTP-EQUIV="REFRESH" CONTENT="30"/>
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE"/>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE"/>
<link rel='stylesheet' id='madza-style-css'  href='css/style.css' type='text/css' media='all' />
<link rel='stylesheet' id='bootstrap-css-css'  href='css/bootstrap.css' type='text/css' media='all' />
<link rel='stylesheet' id='bootstrap-responsive-css-css'  href='css/bootstrap-responsive.min.css' type='text/css' media='all' />

<style type="text/css">
    .site-logo { background:url('images/logo.png'); width:225px; height:92px; float:left;}
    .site-flag { background:url('images/flag.png'); width:146px; height:92px; float:left;}
	.No{background-color:#ff9999;}
	.Yes{background-color:#99ff99;}
	.Pending{background-color:#9999ff;}
	.FirstYes{background-color:#008800;color:white;}
</style>
        </HEAD>
        <BODY>
<header id="header">
	<div class="container">
		<div class="row">
			<div class="span4">	<a class="visible-desktop" style="margin-top:15px" id="logo" href="http://acpc.global">
	   			<div class="site-logo"></div>	
				</a>
				<a class="hidden-desktop" style="margin-top:15px" id="logo" href="http://acpc.global">
				<img  width="225" height="92" src="images/logo.png" alt="ACPC" />
				</a>
				</div>	
			    	<div class="span8 header-right">
			    		<div id="header_html_area"></div>			    		 
        					<div class="site-flag"></div>
        					<ul id="header-socials" class="tt-wrapper"> </ul> 
        						<div class="clear"></div>
	    		</div>
    		</div>
	</div>
		 </header>
            <TABLE border="0">
		<tr>	
			<td><center><xsl:value-of select="/contestStandings/standingsHeader/@title"/></center></td>
		</tr>
	    </TABLE>	
		<TABLE border="0" class="scoreboard" cellspacing="0" style="margin-bottom:10px">
			<tr>
			<td class="FirstYes Yes"><center>First to solve problem</center></td>
			<td class="Yes"><center>Solved problem</center></td>
			<td class="No"><center>Attempted problem</center></td>
			<td class="Pending No"><center>Pending judgement</center></td>
			</tr>
		</TABLE>
            <TABLE border="0">
                <xsl:call-template name="rankRow"/>
                <xsl:call-template name="colorRow"/>
                <xsl:call-template name="teamStanding"/>
                <xsl:call-template name="rankRow"/>
                <xsl:call-template name="colorRow"/>
                <xsl:call-template name="summary"/>
            </TABLE>
<p>
<b>Installed and configured by ACPC</b><br/>Scoreboard is developed by  <A HREF="http://www.ecs.csus.edu/pc2"> CSUS PC^2 <xsl:value-of select="/contestStandings/standingsHeader/@systemVersion"/></A><br/>
<A HREF="http://www.ecs.csus.edu/pc2/">http://www.ecs.csus.edu/pc2/</A><br/>
Last updated
<xsl:value-of select="/contestStandings/standingsHeader/@currentDate"/><br/>
CSS Designed and Developed by iGOUMI
</p>
        </BODY>
    </HTML>
</xsl:template>

        <xsl:template name="summary">
            <xsl:for-each select="standingsHeader">
                <tr>
<td></td>
<td>Submitted/1st Yes/Total Yes</td>
<td></td>
<td></td>
                <xsl:call-template name="problemsummary"/>
<td><xsl:value-of select="@totalAttempts"/>/<xsl:value-of select="@totalSolved"/></td>
                </tr>
            </xsl:for-each>
        </xsl:template>
        <xsl:template name="problemsummary">
            <xsl:for-each select="/contestStandings/standingsHeader/problem">
<!-- <problemsummary attempts="246" bestSolutionTime="25" id="1" lastsolutionTime="283" numberSolved="81" title="A+ Consanguine Calculations"/> -->
<td>
<xsl:value-of select="@attempts"/>/<xsl:if test="@numberSolved &lt; '1'">--</xsl:if>
<xsl:if test="@bestSolutionTime"><xsl:value-of select="@bestSolutionTime"/></xsl:if>/<xsl:value-of select="@numberSolved"/>
</td>
            </xsl:for-each>
        </xsl:template>
        <xsl:template name="teamStanding">
            <xsl:for-each select="teamStanding">
                <tr>
<td><xsl:value-of select="@rank"/></td>
<td><xsl:value-of select="@teamName"/></td>
<td><xsl:value-of select="@solved"/></td>
<td><xsl:value-of select="@points"/></td>
                <xsl:call-template name="problemSummaryInfo"/>
<!-- <teamStanding index="1" solved="8" problemsattempted="8" rank="1" score="1405" teamName="Warsaw University" timefirstsolved="13" timelastsolved="272" totalAttempts="19" userid="84" usersiteid="1"> -->
<td><xsl:value-of select="@totalAttempts"/>/<xsl:value-of select="@solved"/></td>
                </tr>
            </xsl:for-each>
        </xsl:template>
        <xsl:template name="problemSummaryInfo">
            <xsl:for-each select="problemSummaryInfo">
<!-- <problemSummaryInfo attempts="1" index="1" problemid="1" score="73" solutionTime="73"/> -->
<td><center>
<xsl:attribute name="class">
	<!-- is first solution for the problem? -->
		<xsl:variable name="index" select="@index" /> 
		<xsl:variable name="solutionTime" select="@solutionTime" /> 
		<xsl:for-each select="/contestStandings/standingsHeader/problem[@id = $index]"><xsl:if test="@bestSolutionTime = $solutionTime">FirstYes </xsl:if></xsl:for-each>
		<!-- is the problem submission pending? -->
		<xsl:if test="@isPending = 'true'">Pending </xsl:if>
		<!-- is the problem solved or not? -->
       <xsl:if test="@isSolved = 'false' and @attempts>0">No</xsl:if>
       <xsl:if test="@isSolved = 'true'">Yes</xsl:if>
   </xsl:attribute>
<xsl:value-of select="@attempts"/>/<xsl:if test="@isSolved = 'false'">--</xsl:if>
<xsl:if test="@isSolved = 'true'"><xsl:value-of select="@solutionTime"/></xsl:if>
</center></td>
            </xsl:for-each>
        </xsl:template>
        <xsl:template name="problemTitle">
            <xsl:for-each select="/contestStandings/standingsHeader/problem">
<th>&#160;&#160;&#160;&#160;<strong><u><xsl:number format="A" value="@id"/></u></strong>&#160;&#160;&#160;&#160;</th>
            </xsl:for-each>
        </xsl:template>
        <xsl:template name="problemColor">
            <xsl:for-each select="/contestStandings/standingsHeader/colorList/colors[@siteNum = 1]/problem">
                <td><center><xsl:choose><xsl:when test="@color"> <xsl:value-of select="@color"/></xsl:when><xsl:otherwise>Color<xsl:value-of select="@id"/></xsl:otherwise></xsl:choose></center></td>
            </xsl:for-each>
        </xsl:template>
        <xsl:template name="rankRow">
                <tr><th><strong><u>Rank</u></strong></th>
<th><strong><u>Name</u></strong></th>
<th><strong><u>Solved</u></strong></th>
<th><strong><u>Time</u></strong></th>
                <xsl:call-template name="problemTitle"/>
<th>Total att/solv</th></tr>
        </xsl:template>
        <xsl:template name="colorRow">
<tr><td></td><td></td><td></td><td></td>
                <xsl:call-template name="problemColor"/>
</tr>
        </xsl:template>
</xsl:stylesheet>
