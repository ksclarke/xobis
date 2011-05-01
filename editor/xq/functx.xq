declare namespace functx = "http://www.functx.com"; 

declare function functx:siblings-same-name ($element as element()?)  as element()* {       
   $element/../*[node-name(.) = node-name($element)] except $element
 };
 
 1+1