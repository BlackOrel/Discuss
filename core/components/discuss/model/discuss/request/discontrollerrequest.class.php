<?php
require_once MODX_CORE_PATH . 'model/modx/modrequest.class.php';
/**
 * Encapsulates the interaction of MODx manager with an HTTP request.
 *
 * {@inheritdoc}
 *
 * @package discuss
 * @extends modRequest
 */
class DisControllerRequest extends modRequest {
    public $discuss = null;
    public $actionVar = 'action';
    public $defaultAction = 'home';

    function __construct(Discuss &$discuss) {
        parent :: __construct($discuss->modx);
        $this->discuss =& $discuss;
    }

    /**
     * Extends modRequest::handleRequest and loads the proper error handler and
     * actionVar value.
     *
     * {@inheritdoc}
     */
    public function handleRequest() {
        $this->loadErrorHandler();

        /* save page to manager object. allow custom actionVar choice for extending classes. */
        $this->action = isset($_REQUEST[$this->actionVar]) ? $_REQUEST[$this->actionVar] : $this->defaultAction;

        $modx =& $this->modx;
        $discuss =& $this->discuss;
        $viewHeader = include $this->discuss->config['corePath'].'controllers/mgr/header.php';

        $f = $this->discuss->config['corePath'].'controllers/mgr/'.strtolower($this->action).'.php';
        if (file_exists($f)) {
            $this->modx->lexicon->load('discuss:default');
            $viewOutput = include $f;
        } else {
            $viewOutput = 'Action not found: '.$f;
        }

        return $viewHeader.$viewOutput;
    }
}