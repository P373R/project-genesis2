<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/**
 * This file contains functions that deal with manipulating pieces of text.
 */

/**
 * Function: shorten
 * Shortens a text to a specified length.
 *
 * This will keep shortening the text until it finds a space, so that it won't cut off words.
 *
 * Parameters:
 * $text - The text to shorten.
 * $length - The number of characters the text must be shortened to.
 *
 * Returns:
 * The shortened text, or the full text if the text was already short enough.
 *
 * Example Usage:
 * > $str = 'blablabla long string here';
 * > $new_str = shorten($str, 15);
 * > echo $new_str;
 * > //Outputs: 'blablabla long...'
 */
function shorten($text, $length = 50)
{	
    if (strlen($text) > $length)
    {
        $ret = '';
        while (substr($text, $length, 1) != ' ')
        {
            --$length;
        }
        $ret = substr($text, 0, $length);
        $ret .= "...";
        return $ret;
    }
    else
    {
        return $text;
    }
}

function id2name($type,$id)
{
  global $id2names;
  return $id2names[$type][$id];
}

/**
 * Build a Text out of an serialized array of modificators
 */
function itemInfo($info = array())
{
    if(count($info) == 0) return "";
    $text = "";
    if(is_array($info)) foreach($info as $key => $value) {
        if($value != 0) {
            $text.= ucfirst($key). " ";
            if(is_int($value) && $value < 0) $text.= "-"; else $text.= "+";
            $text.= $value."<br />";
        }
    }
    // This is an evil hack :( done since I do not want to change the table headers
    $text = str_replace(array("Agility","Dexterity","Vitality"),array("Speed", "Accuracy", "Shield"),$text);
    return $text;
}
/**
 * Fetches an array of Text phrases in HTML
 */
function translateText($tpl_output, &$tpl)
{
    if(isset($_SESSION['language']) && $_SESSION['language'] != '') {
        $striped = array();
        foreach(preg_split('/<.*?>/',$tpl_output,null,PREG_SPLIT_NO_EMPTY) as $phrase) {
            if(trim($phrase) != '') $striped[] = trim($phrase);
        }

        $translation = "";
        global $ezTranslateLanguage;
        for($iterator = 0; $iterator < count($striped); $iterator++) {
            // there is a translation for that token!
            if(isset($ezTranslateLanguage[$striped[$iterator]]) && $ezTranslateLanguage[$striped[$iterator]] != 'DNT') {
                $tpl_output = preg_replace('/>\s*?'.$striped[$iterator].'\s*?</', '>'.$ezTranslateLanguage[$striped[$iterator]].'<', $tpl_output);
            } elseif($ezTranslateLanguage[$striped[$iterator]] != 'DNT'){
                if(DEBUG_MODE) $translation.= "\$ezTranslateLanguage['".$striped[$iterator]."'] = '';<br />\n";
            }
        }
    }
    return $tpl_output.$translation;
}
?>
