<!DOCTYPE html>
<html lang="en">
  <head>
    <jsp:include page="include/header.jsp" />
  </head>
<body>
<!-- Navbar ================================================== -->
<jsp:include page="include/menu.jsp" />
<!-- Header End====================================================================== -->
<div id="mainBody">
<div class="container">
	<hr class="soften">
	<h1>Pembeliaan Harap Menghubungi No HP Dibawah Ini</h1>
	<hr class="soften"/>	
	<div class="row">
		<div class="span4">
		<h4>Contact Details</h4>
		<p>	GBM 36,<br/> WY 60227, SBY
			<br/><br/>
			Tel 081332939239<br/>
			PIN BB 232B1BCF<br/>
		</p>		
		</div>
			
		<div class="span4">
		<h4>Opening Hours</h4>
			<h5> Monday - Saturday</h5>
			<p>07:30am - 06:00pm<br/><br/></p>
			<h5>Sunday</h5>
			<p>Holiday<br/><br/></p>
		</div>
		<div class="span4">
		<h4>Email Us</h4>
		<form class="form-horizontal">
        <fieldset>
          <div class="control-group">
           
              <input type="text" placeholder="name" class="input-xlarge"/>
           
          </div>
		   <div class="control-group">
           
              <input type="text" placeholder="email" class="input-xlarge"/>
           
          </div>
		   <div class="control-group">
           
              <input type="text" placeholder="subject" class="input-xlarge"/>
          
          </div>
          <div class="control-group">
              <textarea rows="3" id="textarea" class="input-xlarge"></textarea>
           
          </div>

            <button class="btn btn-large" type="submit">Send Messages</button>

        </fieldset>
      </form>
		</div>
	</div>
</div>
</div>
<!-- MainBody End ============================= -->
<!-- Footer ================================================================== -->
<jsp:include page="include/footer.jsp" />
<span id="themesBtn"></span>
</body>
</html>