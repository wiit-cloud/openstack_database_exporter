package nova

// DefaultQuotas holds configurable Nova quota defaults used as fallback
// when no explicit per-project quota and no quota_classes entry exists in the DB.
type DefaultQuotas struct {
	Instances int
	Cores     int
	RAM       int
}

// DefaultDefaultQuotas returns the Nova upstream defaults.
func DefaultDefaultQuotas() DefaultQuotas {
	return DefaultQuotas{
		Instances: 10,
		Cores:     20,
		RAM:       51200,
	}
}
