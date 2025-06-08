(function executeRule(current, previous /*null when async*/ ) {
	if (current.operation() == 'delete' || current.active.changesTo(false)){
		new AisDisableSearchSignalEvent().disable(current.sys_id);
	}
})(current, previous);