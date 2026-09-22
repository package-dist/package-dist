import type { UserConfig } from "@commitlint/types"; // eslint-disable-line n/no-unpublished-import
import { RuleConfigSeverity } from "@commitlint/types"; // eslint-disable-line n/no-unpublished-import

const Configuration: UserConfig = {
  extends: ["@commitlint/config-conventional"],
  rules: {
    "signed-off-by": [RuleConfigSeverity.Error, "always", "Signed-off-by:"],
  },
};

export default Configuration;
