<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
	xmlns:xlink="http://www.w3.org/1999/xlink" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
   xmlns:tei="http://www.tei-c.org/ns/1.0">
   
   <xsl:output 
    		method="html" 
    		encoding="UTF-8"
    		indent="yes" 
    		omit-xml-declaration="yes"/>
   
	<xsl:template match="/">
		<html>
		     <head>
		         <meta charset="UTF-8"></meta>
		         <meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
		        
		  	
        	<link rel="stylesheet" type="text/css" href="cartoline.css"></link>
	
	
            
		        <title>Esame di codifica AA3 - Colonna-Akumah</title>
		   		
           	</head>
         	<body>
               <div id="content">
               	<div id="testa"> 
               		<div id="esaminandi">
               			Esame di codifica dei testi, A.A. 2018-2019: Gennaro Mauro Colonna, matr. 550463  -  Justin Elom Akumah, matr. 543741 - Cartoline 7694-073/001_002, 7694-077/001_002, 7694-079/001_002</div><br/>
               			<div id="navbar">	
                   			<a href="indexCorpus.html">Corpo Cartoline</a>
                   			
             				</div>
             			</div><br/>
             			</div>
             	
            		<div id="contenuto"> 
						<h1><xsl:element name="tei:titleStmt"/></h1>
						 <xsl:value-of select="tei:title[@xml:id='main']"/>
						<xsl:apply-templates/>
            	</div>
   
 

<div id="transcription" class="containerR">
			
            <xsl:for-each select="tei:postcard/tei:div/@type">

              <p>
                <div class="areas" id="DIV{current()}">

                  <xsl:for-each select="tei:ab">
                    <xsl:apply-templates select="."/>
                  </xsl:for-each>
                </div>
              </p>

            </xsl:for-each>


<div id="graphics" class="containerL">

            <xsl:for-each select="/tei:TEI/tei:facsimile/tei:surface">
              <div class="surface" id="grafica_{current()/@type}">
                <ul>
                  <li>
                    <h5>
                      <xsl:value-of select="current()/@type"/>
                    </h5>
                  </li>
                </ul>
<xsl:apply-templates select="current()/tei:graphic"/>
<img src="{current()/@url}" width="{substring-before(@width,'px')}" height="{substring-before(@height,'px')}" id="IMG_{../@xml:id}" usemap="#{../@xml:id}_MAP" class="map"></img>
                <xsl:apply-templates select="current()/tei:graphic"/>
                
                <map name="{current()/@type}_MAP">
                
                  <xsl:apply-templates select="current()/tei:zone"/>
                </map>
                
              </div>
            </xsl:for-each>
          </div>
</div>

      </body>
    </html>
  </xsl:template>
	
  <xsl:template match="//tei:stamp">
    <div class="stamp">

      <xsl:choose>

       
        <xsl:when test="@type='postmark'">
          <br></br>
          <div class="francobollo">

            <xsl:apply-templates select="*|node()"/>

          </div>
        </xsl:when>

        <xsl:when test="@type='postage'">
          <br></br>
          <div class="timbro_postale">

            <xsl:apply-templates select="*|node()"/>

          </div>
        </xsl:when>

        <xsl:otherwise>

          <xsl:apply-templates select="*|node()"/>

        </xsl:otherwise>
      </xsl:choose>
    </div>
  </xsl:template>

 
   <xsl:template match="//tei:place/tei:desc">
    <div class="luogo tooltip">

      <xsl:apply-templates select="*|node()"/>

    </div>
  </xsl:template>

  <xsl:template match="//tei:name">
    <div class="nome tooltip">

      <xsl:apply-templates select="*|node()"/>

    </div>
  </xsl:template>

  <xsl:template match="//tei:addrLine">
    <div class="lineaIndirizzo">
      <xsl:apply-templates select="*|node()"/>
    </div>
    <br></br>
  </xsl:template>

  <xsl:template match="//tei:address">

    <br></br>
    <div class="indirizzo">
      <xsl:apply-templates select="*|node()"/>
    </div>

  </xsl:template>

 

  <xsl:template match="//tei:num">
    <div class="numero tooltip">

      <xsl:apply-templates select="*|node()"/>

    </div>
  </xsl:template>



  <xsl:template match="//tei:note">

    <xsl:choose>

      <xsl:when test="@type='numero'">

        <div class="notaAMano">
          <xsl:apply-templates select="*|node()"/>

        </div>

      </xsl:when>

      <xsl:otherwise>
        <div class="nota">
          <xsl:apply-templates select="*|node()"/>
        </div>
      </xsl:otherwise>
    </xsl:choose>

  </xsl:template>



  <xsl:template match="//tei:date">
    <div class="data tooltip" datazione="{@when}">

      <xsl:apply-templates select="*|node()"/>

    </div>
  </xsl:template>

  <xsl:template match="//tei:div/@facs">
    <div class="areas">

      <xsl:apply-templates select="*|node()"/>

    </div><br/>
  </xsl:template>


  <xsl:template match="//tei:zone">
    <area id="{current()/@xml:id}" shape="poly" coords="{translate(@points,' ',',')}" onclick="creaToolTip('#DIV{current()/@xml:id}')"></area>
    
  </xsl:template>

<!-- l'istruzione sottostante inserisce le figure della cartolina -->
	<xsl:template match="//tei:graphic">
   <div class="dettagli">
    <img src="{current()/@url}" type="illustrazioni" width="{substring-before(@width,'px')}" height="{substring-before(@height,'px')}" id="IMG_{../@xml:id}" usemap="#{../@xml:id}_MAP" class="map"></img>
  <button onclick="winpop()">Dettagli della cartolina</button><br/>

<script>
function winpop() {
  var myWindow = window.open("scegliCartolina.html", "", "width=600,height=515");
}
</script>
</div>
  </xsl:template>

 <xsl:template match="//tei:ab">
    <div class="blocco">

      <xsl:choose>

        <xsl:when test="@facs">
          <br/>
          <div id="DIV{current()/@facs}" class="{current()/@type}">
            <xsl:apply-templates select="*|node()"/>
          </div>
        </xsl:when>

        <xsl:when test="@type='description'">
          <br/>
          <div class="descrizione_fronte">

            <xsl:apply-templates select="*|node()"/>

          </div><br/>
        </xsl:when>

        <xsl:when test="@type='copyright'">

          <xsl:apply-templates select="*|node()"/>

        </xsl:when>

        <xsl:when test="@type='message'">
          <br></br>

          <xsl:apply-templates select="*|node()"/>

        </xsl:when>

        <xsl:otherwise>
          <xsl:apply-templates select="*|node()"/>
        </xsl:otherwise>
      </xsl:choose>
    </div>
  </xsl:template>

 
	
	<!-- I N F O    P R O G E T T O -->
	<!-- titolo principale in rosso ombreggiato -->		
	<xsl:template match="tei:titleStmt">
	 	<div class="title">
	 	
    	
            <h1>
            	<i>
                <xsl:value-of select="tei:title"/> 
               </i>
            </h1>
            <h2><i>               
                    <xsl:value-of select="tei:author"/>
                </i>
            </h2>
		  <hr/>
      </div>
     
    <!-- fine titolo principale -->    
   </xsl:template> 
 
  <!-- in nomi in grassetto del team di codifica -->
  
  	<xsl:template match="tei:respStmt">
  	  	<id class="resp">
  	  	<b><xsl:for-each select="name"/></b>
  	  		<xsl:apply-templates/>
  		</id>
  	</xsl:template>
  <!-- fine team -->
  
  <!-- blocco licenza -->
  
  <xsl:template match="tei:publicationStmt">
  	  	<id class="edizDig">
  	  	<xsl:value-of select="orgName"/>
  	  	      	<xsl:apply-templates/>
  		</id><br/>
  	</xsl:template>
  	<xsl:template match="tei:publicationStmt">
  	  	<id class="edizDig">
  	  	<xsl:value-of select="pubPlace"/>
  	  	      	<xsl:apply-templates/>
  		</id><br/>
  	</xsl:template>
  
  	<xsl:template match="tei:address">
  	  	<id class="palazzo">
  	  	<xsl:value-of select="street[xml:id='matteucci']"/>
  			<xsl:apply-templates/>
  		</id><br/>
  	</xsl:template>

  	<xsl:template match="tei:address">
  	  	<id class="citta">
  	  	<xsl:value-of select="placeName"/>
  	   	<xsl:apply-templates/>
  		</id><br/>
  	</xsl:template>
  	
  	<!-- fine blocco licenza -->
  
  	<xsl:template match="tei:msIdentifier">
  	  	<id class="collocazione">
  	  		<b>Collocazione e numero identificativo:</b>
  	  			<xsl:value-of select="repository"/>
  	  			<xsl:apply-templates/>
  		</id><br/>
  	</xsl:template>
  	
<!-- Cartolina tratta da... -->  	
  	<xsl:template match="tei:notesStmt">
  		<id class="note">
  	  	<xsl:value-of select="note[xml:id='derivazione']"/>
  	    <xsl:apply-templates/>
  		</id><br/>
  	</xsl:template>
  
  <!-- fine cartolina tratta da... -->	
  
  	<xsl:template match="tei:bibl">
  	  <id class="autore">
  		  <xsl:value-of select="persName"/><br/>
  	   	<xsl:apply-templates/>
  		</id><br/>
  	</xsl:template> 

  <xsl:template match="tei:bibl">
  	  	<id class="foto1">
  			<xsl:value-of select="graphic[@url]"/><br/>
  			<xsl:apply-templates/>
  		</id><br/>
  	</xsl:template>
   	
  	<xsl:template match="tei:publisher">
  	  	<id class="tipografia"><br/>
  	  	<b>Produzione:</b><xsl:value-of select="publisher[@xml:id='esb']"/>
  	  	<xsl:apply-templates/>
  		</id><br/>
  	</xsl:template> 
  	
  	<xsl:template match="tei:name">
  	  	<id class="name">
  	 <b> <xsl:value-of select="ref"/></b>
  	  	 <xsl:apply-templates/>
  		</id><br/>
  	</xsl:template> 
  	
  <xsl:template match="tei:supportDesc">
  	  	<id class="oggetto"><br/>
  	  	<p><b>Tipo di oggetto e stato di conservazione:</b> <xsl:value-of select="objectType"/>
  	  	<xsl:value-of select="material"/> 
  	  	<xsl:value-of select="dimensions[@unit]"/></p>
  	  	<xsl:apply-templates/>
  		</id><br/>
  	</xsl:template>
   	 
  	<xsl:template match="tei:msContents">
  	  	<id class="lingua">
  	  	<xsl:value-of select="textLang"/><br/>
				<xsl:apply-templates/>
  		</id><br/>
  	</xsl:template>
 
  	<xsl:template match="tei:condition">
  	  	<id class="statoConservazione">
  	  	<xsl:value-of select="condition"/><br/>
  	  		<xsl:apply-templates/>
  		</id>
  	</xsl:template>
  	
 	<xsl:template match="tei:additional">
		<id class="adminInfo">
		<xsl:value-of select="note"/><br/>
  	  	 <xsl:apply-templates/>
  		</id><br/>
  	</xsl:template>
  	
  <xsl:template match="tei:person">
		<id class="mittente">
		<b>Nome e Cognome:</b><xsl:for-each select="persName"/><br/>
		 	  	 <xsl:apply-templates/>
  		</id><br/>
  	</xsl:template>
  	
  	<xsl:template match="tei:listPlace">
		<id class="place">
		<b>Dati postali:</b><xsl:for-each select="place"/><br/>
		 	  	 <xsl:apply-templates/>
  		</id><br/>
  	</xsl:template>
  	
  	<xsl:template match="tei:listOrg">
		<id class="museo">
		<b>Museo che conserva la cartolina:</b><xsl:for-each select="org"/><br/>
		 	  	 <xsl:apply-templates/>
  		</id><br/>
  	</xsl:template>
	
	<xsl:template match="tei:correspAction">
		<id class="corrispondenti">
		<b>Corrispondenti:</b><xsl:for-each select="correspAction"/><br/>
		 	  	 <xsl:apply-templates/>
  		</id><br/>
  	</xsl:template>
  	<xsl:template match="tei:correspContext">
		<id class="contesto">
		Messaggi:<xsl:for-each select="correspContext"/>
		 	  	 <xsl:apply-templates/>
  		</id><br/>
  	</xsl:template>
	
  	<xsl:template match="tei:body/note">
		<id class="contesto">
		<xsl:for-each select="l"/>
		 	  	 <xsl:apply-templates/>
  		</id><br/>
  	</xsl:template>
  	
  	<xsl:template match="tei:textClass">
		<id class="keys">
		<b>Parole chiave:</b><xsl:for-each select="*"/><br/>	
  	  	 <xsl:apply-templates/>
  		</id><br/>
  	</xsl:template>
  	
  	<xsl:template match="tei:langUsage">
		<id class="keys">
		<b>Lingua usata:</b><xsl:for-each select="*"/>	<br/>
  	  	 <xsl:apply-templates/>
  		</id><br/>
  	</xsl:template>
  	
  	<xsl:template match="tei:body">
		<id class="divMessaggio">
		<b>Retro della cartolina:</b><xsl:for-each select="@message"/>
		 	  	 <xsl:apply-templates/>
  		</id><br/>
  	</xsl:template>
  
   <xsl:template match="tei:summary"><br/>
  	  	<id class="sommario">
  	  	 <b>Sommario:</b><xsl:for-each select="p"/><br/>   	  	   
  	  	  <xsl:apply-templates/>
  		</id><br/>
  	</xsl:template>
  	
 
   <!-- Figures -->


  <xsl:template match="//tei:figure[@facs='front_figure']">
    <div id="DIV{current()/@facs}">
      <h5>
        <xsl:value-of select="//tei:figure/tei:head"/>
      </h5><br/>
      <p>
        <xsl:value-of select="//tei:figure/tei:figDesc"/>
      </p>
    </div><br/>
  </xsl:template>
  

  	
  <!-- attivazione dei collegamenti hyperlink -->
  <xsl:template match="//tei:ref">
  <xsl:choose>

        <xsl:when test="@ref">

          <div class="collegamento">
            <a href="{current()/@ref}" target="_self"><xsl:apply-templates select="*|node()"/></a>

          </div>

        </xsl:when>

        <xsl:otherwise>
          <xsl:apply-templates select="*|node()"/>
        </xsl:otherwise>
      </xsl:choose>
      </xsl:template>
  
  <xsl:template match="//tei:name">
    	<xsl:choose>

        <xsl:when test="@ref">

          <div class="collegamento">
            <a href="{current()/@ref}" target="_blank"><xsl:apply-templates select="*|node()"/></a>

          </div>

        </xsl:when>

        <xsl:otherwise>
          <xsl:apply-templates select="*|node()"/>
        </xsl:otherwise>
      </xsl:choose>
   
  </xsl:template>
<!-- fine collegamenti -->


 	<xsl:template match="//tei:table">
      <div type="table">
         
   	     <table style="width:100%;">
   	     		<xsl:for-each select="//tei:figure/table/row">
   	     			<tr>
   	     				<th>
   	     					<td><xsl:value-of select="risorsa"/></td>
   	     					<td><xsl:value-of select="1914"/></td>
   	     					<td><xsl:value-of select="1916"/></td>
   	     					
   	     				</th>
   	     			</tr>
   	     		
   	     		</xsl:for-each>
   	     </table> 	
   	</div>  
	</xsl:template> 
 

</xsl:stylesheet>
