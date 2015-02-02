package com.pluralsight.security;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.access.PermissionEvaluator;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;

import javax.sql.DataSource;
import java.io.Serializable;

/**
 * Created by daniel.arlitt on 2/1/15.
 */
public class FitnessPermissionEvaluator implements PermissionEvaluator{

  private DataSource datasource;

  public DataSource getDatasource() {
    return datasource;
  }

  public void setDatasource(DataSource datasource) {
    this.datasource = datasource;
  }

  @Override
  public boolean hasPermission(Authentication authentication, Object targetDomainObject, Object permission) {

    JdbcTemplate template = new JdbcTemplate(datasource);

    Object[] args = {
        ((User) authentication.getPrincipal()).getUsername(),
        targetDomainObject.getClass().getName(),
        permission.toString()};

    int count = template.queryForObject(
        "SELECT COUNT(*) FROM permissions p WHERE p.username = ? AND p.target = ? AND p.permission = ?",
        args, Integer.class);

    return count == 1;

  }

  @Override
  public boolean hasPermission(Authentication authentication, Serializable targetId, String targetType, Object permission) {
    return false;
  }
}
