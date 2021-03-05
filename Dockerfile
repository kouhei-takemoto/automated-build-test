FROM redmine:4.1

ENV REDMINE_DB_MYSQL=redmine-mysql \
    REDMINE_DB_DATABASE=redmine \
    REDMINE_DB_USERNAME=redmineuser \
    REDMINE_DB_PASSWORD=redmineuser \
    REDMINE_DB_ENCODING=utf8mb4 \
    REDMINE_PLUGINS_MIGRATE=true

# プラグインのディレクトリ（ハマリポイント）
WORKDIR /usr/src/redmine/plugins

# プラグインの導入
ADD ./redmine_absolute_dates \
    ./redmine_agile \
    ./redmine_checklists \
    ./redmine_default_custom_query \
    ./redmine_github_hook \
    ./redmine_issue_templates \
    ./redmine_pivot_table \
    ./redmine_searchable_selectbox \
    ./redmine_slack \
    ./redmine_theme_changer \
    ./redmine_webhook \
    ./redmine_work_time \
    ./view_customize \
    ./redmine_omniauth_saml

# プラグインファイルの所有権を変更
RUN chown -R redmine:redmine ./

# 必ずWORKDIRをココに戻すこと!!!
WORKDIR /usr/src/redmine
