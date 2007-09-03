package com.atlassian.jira.ext.commitacceptance.server.test;

import java.util.Collection;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.StringUtils;
import org.ofbiz.core.entity.GenericValue;

import com.atlassian.jira.project.Project;
import com.opensymphony.user.User;

/**
 * Mock implementation that does nothing in particular.
 *
 * @author <a href="mailto:ferenc.kiss@midori.hu">Ferenc Kiss</a>
 * @version $Id$
 */
public class MockProjectImpl implements Project {// TODO reorder + arg names
	private String key = StringUtils.upperCase(RandomStringUtils.random(3, true, false));

	public Long getAssigneeType() {
		throw new UnsupportedOperationException();
	}

	public Collection getComponents() {
		throw new UnsupportedOperationException();
	}

	public Long getCounter() {
		throw new UnsupportedOperationException();
	}

	public String getDescription() {
		throw new UnsupportedOperationException();
	}

	public GenericValue getGenericValue() {
		throw new UnsupportedOperationException();
	}

	public Long getId() {
		throw new UnsupportedOperationException();
	}

	public String getKey() {
		return key;
	}

	public User getLead() {
		throw new UnsupportedOperationException();
	}

	public String getName() {
		throw new UnsupportedOperationException();
	}

	public GenericValue getProjectCategory() {
		throw new UnsupportedOperationException();
	}

	public String getUrl() {
		throw new UnsupportedOperationException();
	}

	public Collection getVersions() {
		throw new UnsupportedOperationException();
	}
}