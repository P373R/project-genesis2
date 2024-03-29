<?php
defined('IN_EZRPG') or exit;

/**
  Class: Hooks
  A class to handle adding/running hooks
*/
class Hooks
{
    /**
      Contains the database object.
    */
    protected $db;
    
    /**
      The smarty template object.
    */
    protected $tpl;
    
    /**
      The currently logged in player. Value is 0 if no user is logged in.
    */
    protected $player;
    
    /**
      An array of all hooks, ordered by priority.
    */
    protected $hooks;
    
    /**
      The constructor takes in database, template and player variables to pass onto any hook functions called.
      
      @param $db     An instance of the database class.
      @param $tpl    A smarty object.
      @param $player A player result set from the database, or 0 if not logged in.
    */
    public function __construct(&$db, &$tpl, &$player = 0)
    {
        $this->db = &$db;
        $this->tpl = &$tpl;
        $this->player = &$player;
        
        $this->hooks = array();
    }
    
    /**
      Adds a function to the list of hooks.
      
      @param $hook_name - The name of the hook to add the function to.
      @param $function_name - The name of the hook function, minus the hook_ prefix.
      @param $priority - The priority of the hook function. Higher priority (0) gets called first. Default is 5.
      
      Example:
      This adds a hook to check the user session data to the 'login' hook, with priority 0 so it will run first.
      add_hook('login', 'check_session', 0);
    */
    public function add_hook($hook_name, $function_name, $priority = 5)
    {
        $this->hooks[$hook_name][$priority][] = $function_name;
    }
    
    /**
      This will run all the functions added to a particular hook. Functions called are ordered by priority.
      
      @param $hook_name - The name of the hook to run functions for.
      @param $func_args - An array of arguments to pass to the hook functions. Optional.
    */
    public function run_hooks()
    {
        $num_args = func_num_args();
        if ($num_args == 0)
            return;
        
        //Get function arguments
        $arg_list = func_get_args();
        
        $hook_name = $arg_list[0];
        
        $func_args = 0;
        
        if ($num_args == 2)
        {
            //Single argument or an array of arguments to pass to hook functions
            $func_args = $arg_list[1];
        }
        
        
        //This hook doesn't exist!
        if (!array_key_exists($hook_name, $this->hooks))
            return $func_args;
        
        //Sort by priority
        ksort($this->hooks[$hook_name]);

        foreach($this->hooks[$hook_name] as $priority)
        {
            //Call each hook function separately
            foreach($priority as $hook_function)
            {
                $call_func = 'hook_' . $hook_function;
                
                //Debug mode? Show what's going on
                if (DEBUG_MODE == 1)
                    echo 'Calling hook: ', $call_func, '<br />';
                
                if (!function_exists($call_func))
                    continue;

                //Hook should have a return value
                $func_args = call_user_func($call_func, $this->db, $this->tpl, $this->player, $func_args);
            }
        }
        
        return $func_args;
    }
}
?>
