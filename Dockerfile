FROM uadrupal/base_drush_composer:2.0.0

# Install CGR
RUN composer global require consolidation/cgr:2.0.5

# Install security-checker
RUN cgr sensiolabs/security-checker:6.0.3

# Install php_codesniffer
RUN cgr squizlabs/php_codesniffer:3.5.4

# Install phpcs-security-audit
RUN cgr pheromone/phpcs-security-audit:2.0.1

# Link Security to phpcs
RUN phpcs --config-set installed_paths /composer/global/pheromone/phpcs-security-audit/vendor/pheromone/phpcs-security-audit/Security

RUN useradd -ms /bin/bash azdigital

USER azdigital
WORKDIR /home/azdigital
