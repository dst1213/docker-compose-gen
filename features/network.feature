Feature: Network subcommand

    Scenario: By default defines nothing
        When I run `docker-compose-gen network`

        Then it should pass with exactly:
        """
        version: "2"
        """

    Scenario: Can specify docker compose file version
        When I run `docker-compose-gen network --compose-version 3.1`

        Then it should pass with exactly:
        """
        version: "3.1"
        """

    Scenario: Can generate an internal network
        When I run `docker-compose-gen network --network foo`

        Then it should pass with exactly:
        """
        version: "2"
        networks:
          foo: {}
        """

    Scenario: Can generate an external network
        When I run `docker-compose-gen network --network foo --external-network bar`

        Then it should pass with exactly:
        """
        version: "2"
        networks:
          foo:
            external:
              name: bar
        """

    Scenario: Can generate an external network that replaces the default network
        When I run `docker-compose-gen network --external-network bar`

        Then it should pass with exactly:
        """
        version: "2"
        networks:
          default:
            external:
              name: bar
        """
