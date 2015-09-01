<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

    <head>
	<meta charset="utf-8" />
	<title>Signup Form</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template." name="description" />
	<meta content="Muhammad Usman" name="author" />

	<!-- The styles -->
	<link id="bs-css" href="css/bootstrap-united.css" rel="stylesheet" />
	<style type="text/css">
	    body {
		padding-bottom: 40px;
	    }
	    .sidebar-nav {
		padding: 9px 0;
	    }
	</style>
	<link href="css/bootstrap-responsive.css" rel="stylesheet" />
	<link href="css/charisma-app.css" rel="stylesheet" />
	<link href="css/jquery-ui-1.8.21.custom.css" rel="stylesheet" />
	<link href="css/fullcalendar.css" rel="stylesheet" />
	<link href="css/fullcalendar.print.css" media="print" rel="stylesheet" />
	<link href="css/chosen.css" rel="stylesheet" />
	<link href="css/uniform.default.css" rel="stylesheet" />
	<link href="css/colorbox.css" rel="stylesheet" />
	<link href="css/jquery.cleditor.css" rel="stylesheet" />
	<link href="css/jquery.noty.css" rel="stylesheet" />
	<link href="css/noty_theme_default.css" rel="stylesheet" />
	<link href="css/elfinder.min.css" rel="stylesheet" />
	<link href="css/elfinder.theme.css" rel="stylesheet" />
	<link href="css/jquery.iphone.toggle.css" rel="stylesheet" />
	<link href="css/opa-icons.css" rel="stylesheet" />
	<link href="css/uploadify.css" rel="stylesheet" />


	<link href="css/my_css.css" rel="stylesheet" />

	<!--MY LINKS FOR jQuery SLIDER-->


	<link href="nivo-slider/themes/default/default.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="nivo-slider/themes/light/light.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="nivo-slider/themes/dark/dark.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="nivo-slider/themes/bar/bar.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="nivo-slider/nivo-slider.css" media="screen" rel="stylesheet" type="text/css" />
	<!-- <link rel="stylesheet" href="nivo-slider/demo/style.css" type="text/css" media="screen" /> -->
	<!--END OF LINKS FOR jQuery SLIDER-->




	<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<!-- The fav icon -->
	<link href="img/favicon.ico" rel="shortcut icon" />


    </head>

    <body>
	<!-- topbar starts -->
	<%@include file="header.jsp" %> 
	<!-- topbar ends -->

	<div class="container-fluid">
	    <div class="row-fluid">

		<%@include file="main_menu.jsp" %>



		<div class="row-fluid">
		    <%@ page import="entities.User" %>

		    <%
			// get attributes from the request
			User user = (User) request.getAttribute("user");
			String message = (String) request.getAttribute("message");

			// handle null values
			if (user == null) {
			    user = new User();
			}
			else{
			    out.println("username = " +user.getUsername());
			}
			if (message == null) {
			    message = "";
			}
		    %>




		    <noscript>
			<div class="alert alert-block span10">
			    <h4 class="alert-heading">Warning!</h4>
			    <p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
			</div>
		    </noscript>

		    <!--whole content starts-->
		    <div id="content" style="width: 82.87292817100001%; *width: 82.8197366816383%; margin-left:auto; margin-right:auto;">
			<!--  APOPANW EIXE : class="span10",  KAI DEN EIXE TO STYLE POU EVALA EGW! -->

			<!--main-content sign_up form starts-->
			<div class="row-fluid">
			    <div class="box span12">
				<div class="box-header well" data-original-title="">
				    <%@ page import="entities.User" %>
				    <h2><i><span class="icon-user"></span>&nbsp;</i>Signup Form</h2>
				</div>
				<div class="box-content">

				    <form class="form-horizontal" id="checkform" action="register" method="post">
					<!--fieldset for personal information-->
					<div class="my_legend">Personal Information <i style="color:red; font-size:13px;"> ( Notice: All fields are required-marked with a ' * ' )</i></div>
					<div style="border-bottom: 1px solid #e5e5e5;margin-bottom: 40px; margin-top:0px; width:44%;"></div>
					<fieldset  style="float:left;">
					    <!--<legend class=" my_legend">Personal Information <i style="color:red; font-size:13px;"> ( Notice: All fields are required - marked with a ' * ' )</i></legend>-->
					    <!--Name field-->
					    <div class="control-group">
						<label class="control-label" for="focusedInput">Name</label>
						<div class="controls">
						    <input id="name" class="input-xlarge focused" type="text" name="name" value="<%= user.getName()%>" autocomplete='off' autofocus maxlength="25" />
						    <span style="color:red;">*</span>
						    <span id="namespan"></span>
						</div>
					    </div>
					    <!--Surname field-->
					    <div class="control-group">
						<label class="control-label" for="focusedInput">Surname</label>
						<div class="controls">
						    <input id="surname" class="input-xlarge focused" type="text" name="surname" value="<%= user.getSurname()%>" autocomplete='off' maxlength="30"  />
						    <span style="color:red;">*</span>
						    <span id="surnamespan"></span>
						</div>
					    </div>
					    <!--Username field-->
					    <div class="control-group">
						<label class="control-label" for="focusedInput">Username</label>
						<div class="controls">
						    <input id="username" class="input-xlarge focused" type="text" name="username" value="<%= user.getUsername()%>" autocomplete='off' maxlength="30"  />
						    <span style="color:red;">*</span>
						    <span id="usernamespan"></span>
						</div>
					    </div>
					    <!--Password field-->
					    <div class="control-group">
						<label class="control-label" for="focusedInput">Password</label>
						<div class="controls">
						    <input id="password" class="input-xlarge focused" type="password" name="password" value="<%= user.getPassword()%>" autocomplete='off' maxlength="20" />
						    <span style="color:red;">*</span>
						    <span id="passwordspan"></span>
						</div>
					    </div>
					    <!--Confirm Password field-->
					    <div class="control-group">
						<label class="control-label" for="focusedInput">Confirm Password</label>
						<div class="controls">
						    <input id="confirm_password" class="input-xlarge focused" type="password" name="passwordConf" value="<%= user.getPassword()%>" autocomplete='off' maxlength="20" />
						    <span style="color:red;">*</span>
						    <span id="confirmpasswordspan"></span>
						</div>
					    </div>
					    <!--Email address field-->
					    <div class="control-group">
						<label class="control-label" for="focusedInput">Email address</label>
						<div class="controls">
						    <input id="email" class="input-xlarge focused" type="email" name="email" value="<%= user.getEmail()%>" autocomplete='off' maxlength="40"/>
						    <span style="color:red;">*</span>
						    <span id="emailspan"></span>
						</div>
					    </div>


					    <!--Choose Role field-->

					    <!--Checkboxes field-->
					    <div class="control-group">
						<label class="control-label">Checkboxes</label>
						<div class="controls">
						    <label class="checkbox">
							<div id="uniform-inlineCheckbox1" class="checker">
							    <div id="uniform-inlineCheckbox1" class="checker">
								<span>
								    <input id="checkbox1" style="opacity: 0;" type="checkbox" value="option1" autocomplete='off'/>

								</span>

							    </div>
							</div>

							Confirm personal data <span id="checkbox1span" style="margin-left:125px;"></span>
						    </label>


						    <label class="checkbox">

							<div id="uniform-inlineCheckbox2" class="checker">

							    <div id="uniform-inlineCheckbox2" class="checker">
								<span>
								    <input id="checkbox2" style="opacity: 0;" type="checkbox" value="option2" autocomplete='off' />
								</span>

							    </div>
							</div>

							Accept <a class="btn btn-setting2" id="terms" href="#">terms &amp; conditions</a><span id="checkbox2span" style="margin-left:91px;" ></span>
							<!--btn-setting2 is for the modal... -->
						    </label>
						</div>
					    </div>
					    <!--</fieldset>   -->                           
					    <!-- end of fieldset for personal information--> 
					    <!--<fieldset style=" margin-left: 470px; float:left; display:block;  clear:both;"> -->	
					    <div style="padding-top:10px; padding-bottom:10px; margin-left:250px;">
						<button class="btn btn-primary" id="submit_button" type="submit" >Submit</button>
					    </div>
					</fieldset>
				    </form>
				</div>
				<!--<div class="box-content"> ends-->
			    </div>
			    <!--<div class="box span12"> ends-->
			</div>
			<!--<div class="row-fluid"> ends-->
		    </div>
		    <!--div id=content ends-->
		</div> <!--rowfluid ends-->
	    </div> <!--<div class="row-fluid" ends-->
	    <hr />
	    
	    <div id="myModal2" class=" modal hide fade">
		<div class="modal-header">
		    <button class="close" data-dismiss="modal" type="button"><span class="icon">x</span></button>
		    <h3 style="color: rgb(221, 72, 20);">Terms &amp; Conditions</h3>
		</div>

		<div class="modal-body">
		    <div class="well span5 center login-box" style="text-align:left;">
			<p> Please read these Terms of Use and any Vendor's terms and conditions carefully. We reserve the right to update or otherwise modify these Term of Use from time to time. You are responsible for checking these Terms of Use periodically for changes and updates.</p>
			<p><strong style="color: rgb(221, 72, 20);">1. PRIVACY</strong>. We may collect certain types of personally identifiable information from you. So, Please review our <a href="/privacy/">Privacy Policy</a>, which also governs your visit to Software Advice and sets forth the information we may collect from you and how we will protect it and use it.</p>
			<p><strong style="color: rgb(221, 72, 20);">2. ELECTRONIC COMMUNICATION</strong>. When you send e-mails to us or visit our Website you are communicating with us electronically. By communicating with us via e-mail or by submitting any request on our Website, you agree that we may send e-mail to you and you consent to receive e-mail or other electronic communications from us. Generally, we will communicate with you by e-mail or by posting notices on this Website. Nevertheless, if you request a demo, a price quote, or a download for any Vendor software or Advisor article; request more information about a particular Vendor; or provide us your contact information, you (i) consent and agree to our contacting you by phone at the phone number(s) you provided to us and (ii) consent to us recording or monitoring your phone call for quality assurance or training purposes. There will be no other or further warning concerning our recordation of calls between you and Software Advice staff. You agree that all agreements, notices, disclosures, and other communications that we provide to you electronically satisfy any legal requirement that such communications be in writing and/or that they be sent to the recipient's last known address. By calling our toll-free "800" number, you are likewise consenting to our further contact by telephone at the number or numbers you furnish at the time of the call and to our Privacy Policy and these Terms of Use.</p>
			<p><strong style="color: rgb(221, 72, 20);">3. OWNERSHIP</strong>. All content on the Warehouse Management Systems Guide web site, including (but not limited to), text, graphics, logos, button icons, images, audio clips, digital downloads, data compilations, software, and the compilation of any of the foregoing, is the property of Software Advice, our licensors or Advisors, or our Vendors and is protected by United States and international copyright laws. Except to the minimum extent otherwise expressly permitted under copyright law, no copying, reproduction, modification, use, distribution, or display of the material herein or thereon (regardless of the form or media and whether by download or otherwise) is permitted without the express written permission of Software Advice and any other applicable copyright owner.</p>
			<p>You may not resell any of the services provided by Software Advice, this Website or the Vendors ("Services"). You acknowledge that you do not acquire any ownership rights by virtue of downloading copyrighted material from our Website or the Services. All rights not expressly granted hereunder are expressly reserved to Software Advice and to the respective owners of such rights. If you believe your rights under applicable copyright laws are being infringed by Software Advice or by another person or entity using the Website or the Services, contact us immediately using the contact information furnished in these Terms of Use.</p>
			<p><strong style="color: rgb(221, 72, 20);">4. TRADEMARKS</strong>. The name "Software Advice", and any and all logos and designs connected thereto or associated therewith, and the names and logos of our Vendors ("Trademarks") are the exclusive property of Software Advice and/or the Vendors or Advisors and are protected by federal and state law. You may not use the Trademarks in any way, including, but not limited to, use as meta tags or any other "hidden text", without the express written consent of Software Advice or the applicable Advisor or Vendor.</p>
			<p><strong style="color: rgb(221, 72, 20);">5. LIMITED LICENSE AND PROHIBITED ACTIVITIES</strong>. You have a limited right and license to access the Website for your own specific business or personal use. You may not modify any page on our Website. This limited license strictly prohibits any resale or commercial use of any page on our Website, including any collection or use of any product listings, descriptions, or prices; any derivative use of the Website or any page thereon or associated therewith; any downloading or copying of account information; and any use of data mining, robots, or similar data gathering and extraction tools. You may not reproduce, duplicate, copy, sell, resell, or otherwise exploit any page on the Website for any commercial purpose without the express written consent of Software Advice. You may not frame or utilize framing techniques to enclose any trademark, logo, or other proprietary information (including images, text, page layout, or form) of the Website or our Vendors without our express written consent. Any unauthorized use terminates the permission or license granted by Software Advice and may result in termination of your access to and use of the Website.</p>
			<p>In addition, you represent and warrant that any and all information you post or otherwise provide to Software Advice by means of the Website, including, without limitation, as part of any registration or application or to gain access to any Services, is true, accurate, not misleading, and offered in good faith. Any information disclosed to you via the Services may be used only for its intended purpose. Software Advice expects that you will exercise caution, good sense and proper judgment in using the Services. You can be held liable for any illegal or prohibited content that you provide to Software Advice or to other users, including, for example, infringing, defamatory, or offensive materials. You may not, and hereby represent and warrant that you will not, post, transmit, e-mail, or otherwise make accessible on or through the Website content that:</p>
			<ul>
			    <li>Is unlawful, harmful, threatening, tortious, defamatory, libelous, abusive, disparaging, pedophilic, pornographic, obscene, invasive of another's privacy, hateful, or malicious;</li>
			    <li>Contains hate propaganda or promotes discrimination or violence against any people on account of their race, national origin, religion, age, gender, disability, or sexual orientation;</li>
			    <li>Is or could be harmful to minors;</li>
			    <li>Involves the transmission of "junk mail," "chain letters," or unsolicited mass mailing (or "spamming");</li>
			    <li>Promotes information that you know (or, through the exercise of ordinary care, should have known) is false, misleading, or promotes illegal activities or conduct;</li>
			    <li>Infringes any patent, copyright, trademark, service mark, trade secret, or other proprietary right of any other party;</li>
			    <li>Provides material that exploits people under the age of 18 in a sexual or violent manner, or solicits personal information from anyone under 18;</li>
			    <li>Provides instructional information about illegal activities;</li>
			    <li>Contains a software virus or any other code, files, or programs that are designed to or have the ability to interrupt, destroy, disable, compromise, or otherwise limit the functionality of any computer programs or hardware or telecommunications equipment whether owned by Software Advice or any other person or party;</li>
			    <li>Solicits passwords, or personally identifying information for commercial or unlawful purposes from other users; or</li>
			    <li>Otherwise violates any local, state, national, or other applicable law or regulation.</li>
			</ul>
			<p>In addition, you may not, in connection with the Website:</p>
			<ul>
			    <li>Impersonate any person or entity, including a Software Advice officer or employee, or falsely misrepresent your identification or affiliation in any other way;</li>
			    <li>Forge headers or otherwise manipulate identifiers for the purpose of disguising the origin of any content posted or transmitted through or on this Website;</li>
			    <li>Disrupt the ordinary flow and operation of any portion of this Website;</li>
			    <li>Interfere with or disrupt this Website or any server or network involved with the operation of this Website;</li>
			    <li>Stalk or harass any other person; or</li>
			    <li>Collect or "harvest" from this Website the names of other users for the purpose of transmitting to those other users unsolicited commercial messages.</li>
			</ul>
			<p><strong style="color: rgb(221, 72, 20);">6. YOUR ACCOUNT</strong>. As discussed further in our Privacy Policy, by using this Website, you agree that you are responsible for maintaining the confidentiality of your account and password and for restricting access to your computer, and you agree to accept responsibility for all activities that occur under your account or password.</p>
			<p><strong style="color: rgb(221, 72, 20);">7. YOUR REVIEWS, COMMENTS, COMMUNICATIONS, AND OTHER CONTENT</strong>. Where the capability is offered, you may post reviews, comments, other content; send e-cards and other communications; and submit suggestions, ideas, comments, questions, or other information (collectively, "User-Furnished Content"), so long as none of such User-Furnished Content breach these Terms of Use. Software Advice reserves the right (but not the obligation) to remove or edit such User-Furnished Content, but does not regularly review such User-Furnished Content and assumes no obligation to do so. If you do post any content on this Website or submit material, (i) with respect to all User-Furnished Content other than product reviews, you grant Software Advice and its Vendors a nonexclusive, royalty-free right to use, modify, distribute, reproduce, display, perform, and publish such content and (ii) with respect to product reviews, you assign, and are hereby deemed to have assigned, to Software Advice all your right, title, and interest in and to such reviews, including all intellectual property rights therein and thereto.&nbsp;You grant Software Advice and its Vendors the right to use the name that you submit in connection with such User-Furnished Content, if and as we or they choose. By submitting any content to Software Advice, you represent and warrant that you own or otherwise control all of the rights to the content that you post; that such content is accurate; that use of the content you supply does not violate these Terms of Use and will not cause injury to any person or entity; and that you will indemnify Software Advice and its Vendors for all claims resulting from content you provide. Software Advice has the right, but not the obligation, to monitor and edit or remove any activity or User-Furnished Content. Software Advice takes no responsibility and assumes no liability for any User-Furnished Content posted by you or any third party.</p>
			<p><strong style="color: rgb(221, 72, 20);">8. COPYRIGHT COMPLAINTS</strong>. Software Advice respects the intellectual property rights of others. If you believe that your work has been copied or used in a way that constitutes copyright infringement, you may notify our designated agent by <a href="mailto:don@softwareadvice.com">clicking here</a> and following the posted instructions. [See Notice and Procedure for Making Claims of Copyright Infringement Addendum, <a href="http://www.softwareadvice.com/notice_and_procedure.pdf" target="_blank">attached hereto</a>].</p>
			<p><strong style="color: rgb(221, 72, 20);">9. RISK OF LOSS</strong>. Any products or service that you license, purchase, or otherwise acquire from or through Software Advice are made pursuant to your contract with the particular Vendor from whom you license, purchase, lease, or otherwise acquire the products or service. Software Advice takes no responsibility and assumes no liability for any product or service that you license, purchase, or otherwise acquire from a Vendor at or through this Website and/or Software Advice. Any remedy you may have is exclusively against the Vendor from whom you licensed, purchased, or otherwise acquired any product or service.</p>
			<p><strong style="color: rgb(221, 72, 20);">10. PRODUCT AND SERVICE DESCRIPTIONS</strong>. Software Advice and its Vendors attempt to be as accurate as possible when describing any Services and/or Vendor products. Software Advice, however, makes no representations or warranties that the Service and/or product descriptions or any other content on this Website is accurate, complete, reliable, current, or error-free.</p>
			<p><strong style="color: rgb(221, 72, 20);">11. VENDOR WEBSITES</strong>. Software Advice's Vendors license and sell products and services on or through Software Advice or the Website. Software Advice may provide links to Vendors' websites. Software Advice is not responsible for examining or evaluating, and does not warrant the products or services of, any Vendor or the page of their websites. Software Advice does not assume any responsibility or liability for the actions, products, or services of such Vendors or the page of their Websites. You should carefully review all Vendors' privacy statements and other conditions of use on their websites before you license, lease, purchase, or otherwise acquire any product or service.</p>
			<p><strong style="color: rgb(221, 72, 20);">12. DISCLAIMER OF WARRANTIES AND LIMITATION OF LIABILITY AND INDEMNITY</strong>. Software Advice, this Website and the Services ARE PROVIDED ON AN "AS IS" AND "AS AVAILABLE" BASIS. SOFTWARE ADVICE MAKES NO REPRESENTATIONS OR WARRANTIES OF ANY KIND, EXPRESS OR IMPLIED, AS TO THE OPERATION OF THIS WEBSITE OR THE INFORMATION, CONTENT, MATERIALS, SERVICES OR PRODUCTS INCLUDED ON OR DESCRIBED IN THIS WEBSITE. YOU EXPRESSLY AGREE THAT YOUR USE OF THIS WEBSITE IS AT YOUR SOLE RISK.</p>
			<p>TO THE FULL EXTENT PERMISSIBLE BY APPLICABLE LAW, SOFTWARE ADVICE DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. SOFTWARE ADVICE DOES NOT WARRANT THAT THIS WEBSITE, ITS SERVERS, THE SERVICES PROVIDED OR E-MAIL SENT BY OR FROM SOFTWARE ADVICE ARE ERROR FREE OR FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS. YOU EXPRESSLY UNDERSTAND AND AGREE THAT SOFTWARE ADVICE SHALL NOT BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, PUNITIVE, CONSEQUENTIAL OR EXEMPLARY DAMAGES ARISING OUT OF OR IN ANY WAY RELATED TO THESE TERMS OF USE, THE USE OF THIS WEBSITE OR THE SERVICES, INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS OF PROFITS, GOODWILL, USE, DATA OR OTHER INTANGIBLE LOSSES (EVEN IF SOFTWARE ADVICE HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES). TO THE EXTENT THE FOREGOING LIMITATION OF LIABILITY IS, IN WHOLE OR IN PART, HELD TO BE INAPPLICABLE OR UNENFORCEABLE FOR ANY REASON, THEN THE AGGREGATE LIABILITY OF SOFTWARE ADVICE FOR ANY REASON AND UPON ANY CAUSE OF ACTION (INCLUDING, WITHOUT LIMITATION, NEGLIGENCE, STRICT LIABILITY AND OTHER ACTIONS IN CONTRACT OR TORT) ARISING OUT OF OR IN ANY WAY RELATED TO THE SERVICES, THIS WEBSITE OR THESE TERMS OF USE SHALL BE LIMITED TO DIRECT DAMAGES ACTUALLY INCURRED UP TO ONE HUNDRED UNITED STATES DOLLARS ($100).</p>
			<p>THIS LIMITATION OF LIABILITY APPLIES TO ALL LIABILITIES IN THE AGGREGATE, INCLUDING, WITHOUT LIMITATION, THOSE RESULTING FROM YOUR USE OR YOUR INABILITY TO USE THIS WEBSITE OR DERIVE BENEFIT FROM THE SERVICES, OR ANY OTHER MATTER ARISING FROM OR RELATING TO THIS WEBSITE OR THE SERVICES. BECAUSE SOME STATES OR JURISDICTIONS DO NOT ALLOW THE EXCLUSION OR LIMITATION OF LIABILITY FOR CONSEQUENTIAL OR INCIDENTAL DAMAGES, THE ABOVE LIMITATION MAY NOT APPLY TO YOU.</p>
			<p>You agree to indemnify and hold Software Advice and its affiliates harmless, and, at Software Advice’s request, to defend Software Advice and its affiliates from and against any allegation, claim, demand, cause of action, debt, loss or liability, including reasonable attorneys’ fees, to the extent that such action is based upon, arises out of, or relates to your use (or inability to use) of this Website or any of the Services or any other activities of yours through using this Website or the Services.</p>
			<p><strong style="color: rgb(221, 72, 20);">13. APPLICABLE LAW</strong>. By visiting this Website and/or by consenting to these Terms of Use, you agree that the laws of the state of Texas, without regard to principles of conflict of laws, will govern these Terms of Use and any dispute of any sort that might arise between you and Software Advice or our Vendors.</p>
			<p><strong style="color: rgb(221, 72, 20);">14. DISPUTES</strong>. Any dispute relating in any way to your visit to our Website or to products you license or purchase through Software Advice (where Software Advice, Inc. is named as a party) shall be submitted to arbitration in Travis County, Texas, pursuant to the commercial arbitration rules of and under the auspices of the American Arbitration Association. Notwithstanding the foregoing, if you have in any manner violated or threatened to violate Software Advice's intellectual property rights, Software Advice may seek injunctive or other appropriate relief in any state or federal court in the state of Texas, and you consent to exclusive jurisdiction and venue in such courts. The arbitration award shall be binding and may be entered as a judgment in any court of competent jurisdiction. To the fullest extent permitted by applicable law, no arbitration under these Terms of Use shall be joined to an arbitration involving any other party subject to these Terms of Use, whether through class arbitration proceedings or otherwise.</p>
			<p><strong  style="color: rgb(221, 72, 20);">15. WEBSITE POLICIES, MODIFICATION, AND SEVERABILITY</strong>. Please review our other policies, such as our Privacy Policy, <a href="/privacy-policy/">available here</a>. If any of these Terms of Use shall be deemed invalid, void, or for any reason unenforceable, that term shall be deemed severable and shall not affect the validity and enforceability of any remaining term or provision of these Terms of Use.</p>

		    </div><!--/span-->
		</div>	<!--modal-body-->
	    </div><!--my modal ends-->

		<%@ include file="/login.jsp" %>

	    <%@include file="footer.jsp" %>
		<a class="btn btn-setting3" id="enable_modal3_button"  href="#" style="display: none;"> <!--btn-setting is for the modal... -->
		</a>

	</div>
	    
	<!--container-fluid ends-->


	<!--MY LINKS FOR jQuery SLIDER-->

	<!--<script type="text/javascript" src= "nivo-slider/demo/scripts/jquery-1.9.0.min.js" ></script>
    <script type="text/javascript" src= "nivo-slider/jquery.nivo.slider.js"></script>
    <script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();
    });
    </script>-->

	<!--END OF LINKS FOR jQuery SLIDER-->


	<!-- external javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- jQuery -->
	<script src="js/jquery-1.7.2.min.js"></script>
	<!-- jQuery UI -->


	<script src="nivo-slider/jquery.nivo.slider.js" type="text/javascript"></script>
	<script type="text/javascript">
	    $(window).load(function() {
		$('#slider').nivoSlider();
	    });
	</script>

	<script src="js/validate_form.js" type="text/javascript"></script>


	<script src="js/jquery-ui-1.8.21.custom.min.js"></script>

	<!-- transition / effect library -->
	<script src="js/bootstrap-transition.js"></script>
	<!-- alert enhancer library -->
	<script src="js/bootstrap-alert.js"></script>
	<!-- modal / dialog library -->
	<script src="js/bootstrap-modal.js"></script>
	<!-- custom dropdown library -->
	<script src="js/bootstrap-dropdown.js"></script>
	<!-- scrolspy library -->
	<script src="js/bootstrap-scrollspy.js"></script>
	<!-- library for creating tabs -->
	<script src="js/bootstrap-tab.js"></script>
	<!-- library for advanced tooltip -->
	<script src="js/bootstrap-tooltip.js"></script>
	<!-- popover effect library -->
	<script src="js/bootstrap-popover.js"></script>
	<!-- button enhancer library -->
	<script src="js/bootstrap-button.js"></script>
	<!-- accordion library (optional, not used in demo) -->
	<script src="js/bootstrap-collapse.js"></script>
	<!-- carousel slideshow library (optional, not used in demo) -->
	<script src="js/bootstrap-carousel.js"></script>
	<!-- autocomplete library -->
	<script src="js/bootstrap-typeahead.js"></script>
	<!-- tour library -->
	<script src="js/bootstrap-tour.js"></script>
	<!-- library for cookie management -->
	<script src="js/jquery.cookie.js"></script>
	<!-- calander plugin -->
	<script src="js/fullcalendar.min.js"></script>
	<!-- data table plugin -->
	<script src="js/jquery.dataTables.min.js"></script>

	<!-- chart libraries start -->
	<script src="js/excanvas.js"></script>
	<script src="js/jquery.flot.min.js"></script>
	<script src="js/jquery.flot.pie.min.js"></script>
	<script src="js/jquery.flot.stack.js"></script>
	<script src="js/jquery.flot.resize.min.js"></script>
	<!-- chart libraries end -->

	<!-- select or dropdown enhancer -->
	<script src="js/jquery.chosen.min.js"></script>
	<!-- checkbox, radio, and file input styler -->
	<script src="js/jquery.uniform.min.js"></script>
	<!-- plugin for gallery image view -->
	<script src="js/jquery.colorbox.min.js"></script>
	<!-- rich text editor library -->
	<script src="js/jquery.cleditor.min.js"></script>
	<!-- notification plugin -->
	<script src="js/jquery.noty.js"></script>
	<!-- file manager library -->
	<script src="js/jquery.elfinder.min.js"></script>
	<!-- star rating plugin -->
	<script src="js/jquery.raty.min.js"></script>
	<!-- for iOS style toggle switch -->
	<script src="js/jquery.iphone.toggle.js"></script>
	<!-- autogrowing textarea plugin -->
	<script src="js/jquery.autogrow-textarea.js"></script>
	<!-- multiple file upload plugin -->
	<script src="js/jquery.uploadify-3.1.min.js"></script>
	<!-- history.js for cross-browser state change on ajax -->
	<script src="js/jquery.history.js"></script>
	<!-- application script for Charisma demo -->
	<script src="js/charisma.js"></script>

	<!-- MY JS FILE FOR CREATE_ACCOUNT-->
	<script src="js/register-selected-role.js"></script>

        <!--<script language="JavaScript" src="js/validateform.js"></script>-->
	<!--<script src="js/enable_modal_manually.js"></script>	-->

	<%  boolean go=true;
	    if ( request.getAttribute("message") != null && (request.getAttribute("message") == "wu" || request.getAttribute("message") == "we")){
			go=false;
			//out.println("mphkaedw kai " + request.getAttribute("message"));
	%>
		<script src="js/modal3_only_manually.js"></script>
	<%
		}
		if (((String) request.getAttribute("message") != null && (String) request.getAttribute("message") != "ok" && (String) request.getAttribute("message") != "pend") && go ) {
	%>
		<script src="js/enable_modal_manually.js"></script>
	<%}%>
	

    </body>
</html>