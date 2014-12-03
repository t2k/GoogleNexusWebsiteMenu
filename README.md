
Google Nexus Website Menu
=========
A tutorial on how to recreate the slide out sidebar menu that can be seen on the Google Nexus 7 website.

[article on Codrops](http://tympanus.net/codrops/?p=16030)

[demo](http://tympanus.net/Tutorials/GoogleNexusWebsiteMenu/)

[LICENSING & TERMS OF USE](http://tympanus.net/codrops/licensing/)

Really like this for a mobile slide in menu.  

JS tweaks:
We wanted to close the menu after a menu has been selected, so commented out the 

    ev.stopPropagation()

in the menu.addEventListener

CSS tweaks:
to allow menu to flow over adjacent content:

    .gn-menu-main {
    	z-index: 10;
	}


We're targeting the :last li for a dynamic edit state menu

	.gn-menu-main > li:last-child > ul > li {
		padding: 0 8px;

