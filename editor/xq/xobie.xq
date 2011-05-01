    declare namespace xhtml = 'http://www.w3.org/1999/xhtml';

    declare updating function local:tabListener($tab as element(), $evtObj) {
        let $node := <li class='tab' id='activetab'>{string($tab)}</li>
        return
            if ($tab[@id="activetab"]) then ()
            else (
                delete node b:dom()//li[@class='tab']/@id[.='activetab'],
                insert node $node before $tab,
                delete node $tab,
                b:addEventListener(b:dom()//li/@id[.='activetab'], 'onclick', xs:QName("local:tabListener"))
            )
    };

    for $tab in b:dom()//li[@class='tab']
    return b:addEventListener($tab, "onclick", xs:QName("local:tabListener"))