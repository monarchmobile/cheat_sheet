

<style>
    .draggable { width: 100px; height: 100px; padding: 0.5em; float: left; margin: 10px 10px 10px 0;}
    #droppable { width: 150px; height: 150px; padding: 0.5em; float: left; margin: 10px; }
    .definitions {
        clear:both;
        background:#ECE8E8;
        box-shadow: 1px 1px 5px;
        width:500px;
        margin:20px 10px;
        padding:10px;
    }
    .definitions p {
        margin-left:10px;

    }
    h3 {
        color:#3b5998;
    }
</style>
<script>
$(function() {
    $( ".draggable" ).draggable({helper: "clone"});
    
    $( "#droppable" ).droppable({
        
        accept: ".draggable", 
        drop: function( event, ui ) {
            $( this )
                .addClass( "ui-state-highlight" )
                .find( "p" )
                    .html( "Dropped!" );
            $( "<li></li>" ).text( ui.draggable.attr("data-id") ).appendTo( this );
            

        }
    });
});
</script>

<div class="draggable ui-widget-content" data-id="1st">
    <p>Drag me(1) to my target</p>
</div>
<div class="draggable ui-widget-content" data-id="2nd">
    <p>Drag me(2) to my target</p>
</div>
 
<div id="droppable" class="ui-widget-header">
    <p>Drop here</p>
    <li></li>
</div>
 

 <div class="definitions" style="margin-top:100px;">
     <p>
         <h2>droppable methods</h2>
         <h3>accept</h3>: Specify using the accept option which element (or group of elements) 
                is accepted by the target droppable. 
         <h3>drop</h3>: what happends after the drop. 
         <h3>greedy</h3>: the greedy option set to true prevents the bubbling of an event to parent elements, preventing any parent handlers from being notified of the event. when a draggable is dropped on a child node. 
         <h3>revert</h3>: valid: helper reverts to original position when dropped <br />
         invalid: no reverting. 
         <h3>leave in dropped zone</h3>: $( "#draggable" ).appendTo( this );
     </p>
</div>
<div class="definitions">
     <p>
         <h2>draggable methods</h2>
         <h3>cancel: "a.ui-icon"</h3>
          // clicking an icon won't initiate dragging
         <h3>revert: "invalid"</h3>
         // when not dropped, the item will revert back to its initial position
         <h3>containment: "document"</h3>
         $( "#draggable" ).draggable({ axis: "y" });
         $( "#draggable2" ).draggable({ axis: "x" });
 
         $( "#draggable3" ).draggable({ containment: "#containment-wrapper", scroll: false });
         $( "#draggable5" ).draggable({ containment: "parent" });
         <h3>helper: "clone"</h3>
         <h3>cursor: "move" </h3>
         <h3>scroll</h3>
         $( "#draggable" ).draggable({ scroll: true });
         $( "#draggable2" ).draggable({ scroll: true, scrollSensitivity: 100 });
         $( "#draggable3" ).draggable({ scroll: true, scrollSpeed: 100 });
         <h3>cursor</h3>
         $( "#draggable" ).draggable({ cursor: "move", cursorAt: { top: 56, left: 56 } });
         $( "#draggable2" ).draggable({ cursor: "crosshair", cursorAt: { top: -5, left: -5 } });
         $( "#draggable3" ).draggable({ cursorAt: { bottom: 0 } });
         <h3>delay</h3>
         $( "#draggable" ).draggable({ distance: 20 });
         $( "#draggable2" ).draggable({ delay: 1000 });
        
         <h3>stop: function(event, ui)</h3>
         <h3>stop: function(event, ui)</h3>
         <h3>stop: function(event, ui)</h3>
     </p>
</div>
<div class="definitions">
     <p>
         <h2>styling</h2>

         <!-- styling -->
         <h3>ui-widget-header</h3> is a gray background 2 tone
         <h3>ui-widget-content</h3> is a white background
         <h3>ui-widget-highlight</h3> is a yellow background, border:1px solid darker yellow
     </p>
</div>