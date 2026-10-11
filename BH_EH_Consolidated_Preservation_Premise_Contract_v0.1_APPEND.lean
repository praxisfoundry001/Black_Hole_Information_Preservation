/-!
BH-EH EVENT-HORIZON PRESERVATION PREMISE AUDIT
INTEGRATED APPEND-ONLY LEAN CONTRACT v0.1

INSTALLATION
Paste this file ONCE, immediately below the unchanged
Structural_Flow_Universal_Kernel_v1.0.lean, after its final
`end StructuralFlow`. Do NOT append the seven component files again.
BH-EH-03 is a source/literature audit, not a Lean module.

FROZEN PHYSICAL QUESTION
Does a theorem plus independently earned physical applicability establish
GLOBAL QUANTUM INFORMATION PRESERVATION through COMPLETE EVAPORATION of
an ACTUAL FOUR-DIMENSIONAL EVENT-HORIZON BLACK HOLE IN OUR UNIVERSE?
This is not an AdS analogue, not a finite quantum toy, not a stationary
Schwarzschild substitute, and not merely an exterior observer's recoverability.

SCOPE / FORMAL INTEGRITY
* The existing modules are included verbatim, in ascending audit order,
  with the corrected BH-EH-08 v0.2 (not the v0.1 predecessor).
* Unchanged Universal Kernel: not copied or edited by this appendix.
* Every emitted theorem remains in its original unique namespace.
* Module proofs formally establish only their LOGIC, COUNTERMODELS and
  ADMISSION RULES, not physical existence, cosmic unitarity or loss.
* No independent global fate, statistical prevalence of recoverability,
  or full physical Single-Boundary identity is asserted.
* A positive physical proof of unitarity, or a physical proof of loss,
  changes the DOMAIN verdict. It does not automatically revise SF canon.
* Two constituent modules (02, 05) have not been compiled independently.
  Neither the integration nor those two modules is machine-closed until
  the ENTIRE combined file passes Lean Web.
-/

/- ==== BEGIN BH-EH-01 : BH_EH01_Formal_Contract_v0.1_APPEND.lean [SOURCE PRESERVED] ==== -/
/-
BH-EH-01: EVENT-HORIZON / SF HINGE-ROUTE ADMISSION CONTRACT v0.1
Lean 4, no imports, no axioms, no `sorry`.
Append BELOW the final `end StructuralFlow` of the existing universal kernel.
Or paste by itself into Lean Web to check this module without the kernel.
Do NOT paste twice into the same namespace/session.

FORMAL SCOPE: conditional logical implications and countervaluations for an
ordinary causal route from strictly inside a genuine GR event horizon to the
admitted exterior future. No model here proves the existence of an astrophysical
event horizon, four-dimensional quantum-gravity dynamics, full SF density-threshold
identity, complete evaporation, global preservation, fundamental loss, or any
statistical rate of recovery in our universe.

SOURCE SEMANTICS: SF TOE v1.4, Entropy, Persistence, Boundary, Cascade,
Authorization, non-guarantee, route-admission; SBR v1.5 Chs. 4-6;
BHIS-C6 v1.3; preliminary physical premise audit v0.1.

The interface below records the minimal physical-to-SF logical bridge as explicit
hypotheses. It does NOT discharge or certify those hypotheses from observation.
-/
namespace StructuralFlow
namespace BHEH01

/- An external auditor must supply the physical instantiation, including the
meaning of `outward`, `causalReach`, and the causal route being attempted.
The structure can describe a target; it does not establish its existence. -/
structure HorizonRouteInterface (Route : Type) where
  outward : Route -> Prop
  causalReach : Route -> Prop
  cascade : Route -> Prop
  authorization : Route -> Prop
  persists : Route -> Prop
  boundary : Route -> Prop
  admitted : Route -> Prop
  /- Actual event-horizon no-escape is a DECLARED PHYSICAL PREMISE. -/
  horizonNoEscape : forall r, outward r -> Not (causalReach r)
  /- Limited to ORDINARY CAUSAL inheritance through the outward route. -/
  ordinaryCascadeRequiresReach :
    forall r, outward r -> cascade r -> causalReach r
  /- Foundational SF prerequisite order, at this declared route. -/
  authorizationRequiresCascade :
    forall r, authorization r -> cascade r

/- Scoped theorem: no ordinary outward Cascade across this horizon route. -/
theorem outward_cascade_blocked
    {Route : Type} (h : HorizonRouteInterface Route)
    (r : Route) (hr : h.outward r) : Not (h.cascade r) := by
  intro hc
  exact h.horizonNoEscape r hr
    (h.ordinaryCascadeRequiresReach r hr hc)

/- Scoped theorem: no downstream Authorization THROUGH THIS SAME ROUTE. -/
theorem outward_authorization_blocked
    {Route : Type} (h : HorizonRouteInterface Route)
    (r : Route) (hr : h.outward r) : Not (h.authorization r) := by
  intro ha
  exact outward_cascade_blocked h r hr
    (h.authorizationRequiresCascade r ha)

/- Combined machine-checkable conditional route closure. -/
theorem route_closure
    {Route : Type} (h : HorizonRouteInterface Route) :
    forall r, h.outward r ->
      (Not (h.cascade r) /\ Not (h.authorization r)) := by
  intro r hr
  exact And.intro
    (outward_cascade_blocked h r hr)
    (outward_authorization_blocked h r hr)

/- Candidate Echo classification is NOT automatic: Persistence, Boundary and
route admission must be independently warranted. -/
def AdmittedEchoCandidate {Route : Type}
    (h : HorizonRouteInterface Route) (r : Route) : Prop :=
  h.admitted r /\ h.persists r /\ h.boundary r /\ Not (h.cascade r)

theorem echo_requires_independent_prior_admission
    {Route : Type} (h : HorizonRouteInterface Route)
    (r : Route) (hr : h.outward r)
    (hAdmission : h.admitted r)
    (hPersistence : h.persists r)
    (hBoundary : h.boundary r) :
    AdmittedEchoCandidate h r := by
  exact And.intro hAdmission
    (And.intro hPersistence
      (And.intro hBoundary (outward_cascade_blocked h r hr)))

/- First reopening / falsifier surfaces are logical contradictions conditional
on STILL maintaining precisely the same registered physical bridge. -/
theorem positive_ordinary_outward_cascade_reopens_route
    {Route : Type} (h : HorizonRouteInterface Route)
    (r : Route) (hr : h.outward r) (hCascade : h.cascade r) : False := by
  exact outward_cascade_blocked h r hr hCascade

theorem positive_outward_causal_reach_reopens_horizon_premise
    {Route : Type} (h : HorizonRouteInterface Route)
    (r : Route) (hr : h.outward r)
    (hReach : h.causalReach r) : False := by
  exact h.horizonNoEscape r hr hReach

/- The following are LOGICAL COMPLETIONS, not physical models of evaporation.
Their only function is to test whether the bounded SF/horizon premises alone
entail a physical global-preservation or loss verdict. They do not. -/
structure LogicalCompletion where
  enclosingBoundary : Bool
  ordinaryOutwardCascade : Bool
  globalQuantumPreservation : Bool
  someExteriorQuantumRecovery : Bool
  deriving DecidableEq, Repr

def HorizonSFPattern (m : LogicalCompletion) : Prop :=
  m.enclosingBoundary = true /\ m.ordinaryOutwardCascade = false

def preservingCompletion : LogicalCompletion :=
  { enclosingBoundary := true
    ordinaryOutwardCascade := false
    globalQuantumPreservation := true
    someExteriorQuantumRecovery := false }

def nonpreservingCompletion : LogicalCompletion :=
  { enclosingBoundary := true
    ordinaryOutwardCascade := false
    globalQuantumPreservation := false
    someExteriorQuantumRecovery := false }

def partlyRecoverableCompletion : LogicalCompletion :=
  { enclosingBoundary := true
    ordinaryOutwardCascade := false
    globalQuantumPreservation := false
    someExteriorQuantumRecovery := true }

theorem both_completions_share_horizon_pattern :
    HorizonSFPattern preservingCompletion /\
    HorizonSFPattern nonpreservingCompletion := by
  simp [HorizonSFPattern, preservingCompletion, nonpreservingCompletion]

/- Relative NON-ENTAILMENT, only in the minimal signature above. -/
theorem horizon_pattern_does_not_entail_global_preservation :
    Not (forall m : LogicalCompletion,
      HorizonSFPattern m -> m.globalQuantumPreservation = true) := by
  intro h
  have impossible := h nonpreservingCompletion (by
    simp [HorizonSFPattern, nonpreservingCompletion])
  simp [nonpreservingCompletion] at impossible

theorem horizon_pattern_does_not_entail_global_loss :
    Not (forall m : LogicalCompletion,
      HorizonSFPattern m -> m.globalQuantumPreservation = false) := by
  intro h
  have impossible := h preservingCompletion (by
    simp [HorizonSFPattern, preservingCompletion])
  simp [preservingCompletion] at impossible

theorem global_preservation_does_not_entail_exterior_recovery :
    Not (forall m : LogicalCompletion,
      m.globalQuantumPreservation = true ->
      m.someExteriorQuantumRecovery = true) := by
  intro h
  have impossible := h preservingCompletion (by
    simp [preservingCompletion])
  simp [preservingCompletion] at impossible

theorem some_exterior_recovery_does_not_entail_global_preservation :
    Not (forall m : LogicalCompletion,
      m.someExteriorQuantumRecovery = true ->
      m.globalQuantumPreservation = true) := by
  intro h
  have impossible := h partlyRecoverableCompletion (by
    simp [partlyRecoverableCompletion])
  simp [partlyRecoverableCompletion] at impossible

/- Reopening is localized. None of these labels constitutes empirical evidence. -/
inductive ReopenSurface where
  | noActualEventHorizon
  | outwardRouteOrCausalBridgeMismatched
  | positiveOrdinaryOutwardReach
  | persistenceBoundaryOrAdmissionFails
  | fullDensityThresholdIdentityDefeated
  | independentlyEarnedPhysicalPreservation
  | independentlyEarnedPhysicalLoss
  | foundationalNoFreeImmunityCounterderivation
  deriving DecidableEq, Repr

inductive ReopenLevel where
  | physicalTarget
  | domainTranslation
  | domainInformationVerdict
  | universalSF
  deriving DecidableEq, Repr

def impact : ReopenSurface -> ReopenLevel
  | .noActualEventHorizon => .physicalTarget
  | .outwardRouteOrCausalBridgeMismatched => .domainTranslation
  | .positiveOrdinaryOutwardReach => .domainTranslation
  | .persistenceBoundaryOrAdmissionFails => .domainTranslation
  | .fullDensityThresholdIdentityDefeated => .domainTranslation
  | .independentlyEarnedPhysicalPreservation => .domainInformationVerdict
  | .independentlyEarnedPhysicalLoss => .domainInformationVerdict
  | .foundationalNoFreeImmunityCounterderivation => .universalSF

/- Closure is LOCALIZED: an independently earned physical preservation law
changes the domain information verdict, not the universal no-free-immunity
corollary. Only a counterderivation from universal SF premises goes upstream. -/
theorem reopening_locality_checkpoint :
    impact .independentlyEarnedPhysicalPreservation =
      ReopenLevel.domainInformationVerdict /\
    impact .fullDensityThresholdIdentityDefeated =
      ReopenLevel.domainTranslation /\
    impact .foundationalNoFreeImmunityCounterderivation =
      ReopenLevel.universalSF := by
  simp [impact]

/- Precise closure scope, not an empirical verdict. -/
inductive ClosureLevel where
  | conditionalRouteLogic
  | actualEventHorizonEvidence
  | fullSBRPhysicalIdentity
  | completeQuantumEvolution
  | globalInformationFate
  deriving DecidableEq, Repr

def logicallyClosed (c : ClosureLevel) : Bool :=
  match c with
  | .conditionalRouteLogic => true
  | _ => false

/- CHECKPOINT: the sole positive `true` in `logicallyClosed` is the local
conditional route logic; every physical status is deliberately unadmitted. -/
theorem closure_scope_checkpoint :
    logicallyClosed .conditionalRouteLogic = true /\
    logicallyClosed .actualEventHorizonEvidence = false /\
    logicallyClosed .fullSBRPhysicalIdentity = false /\
    logicallyClosed .completeQuantumEvolution = false /\
    logicallyClosed .globalInformationFate = false := by
  simp [logicallyClosed]

#check outward_cascade_blocked
#check outward_authorization_blocked
#check route_closure
#check echo_requires_independent_prior_admission
#check positive_ordinary_outward_cascade_reopens_route
#check positive_outward_causal_reach_reopens_horizon_premise
#check horizon_pattern_does_not_entail_global_preservation
#check horizon_pattern_does_not_entail_global_loss
#check global_preservation_does_not_entail_exterior_recovery
#check some_exterior_recovery_does_not_entail_global_preservation
#check reopening_locality_checkpoint
#check closure_scope_checkpoint

end BHEH01
end StructuralFlow
/- ==== END BH-EH-01 ==== -/

/- ==== BEGIN BH-EH-02 : BH_EH02_Premise_Admission_Formal_Contract_v0.1_APPEND.lean [SOURCE PRESERVED] ==== -/
/-!
BH-EH-02: PHYSICAL GLOBAL PRESERVATION PREMISE-ADMISSION GATE
Append ONLY after the existing universal kernel and BH-EH-01 contract.
No import or change of universal kernel; no new axioms or sorry.
This formalizes logical scope dependencies, NOT black-hole physics.
Not locally Lean-compiled. User should check in Lean Web.
-/

namespace StructuralFlow.BHEH02

/- A literature-derived model proposition is different from its actual-
cosmos applicability and physically complete quantum-output claim. -/
structure PreservationAdmission where
  unitaryModelProof : Prop
  eventHorizonPhysicalBridge : Prop
  completeFinalPhysicalAlgebra : Prop
  allCodeQuantumPreservation : Prop

/- These conjunctions are an ADMISSION CONTRACT, not a statement that the
conjuncts are already established for any black hole. -/
def PhysicallyAdmitted (p : PreservationAdmission) : Prop :=
  p.unitaryModelProof /\
  p.eventHorizonPhysicalBridge /\
  p.completeFinalPhysicalAlgebra /\
  p.allCodeQuantumPreservation

theorem admission_requires_horizon_bridge
    (p : PreservationAdmission) (h : PhysicallyAdmitted p) :
    p.eventHorizonPhysicalBridge := h.2.1

theorem admission_requires_output_completeness
    (p : PreservationAdmission) (h : PhysicallyAdmitted p) :
    p.completeFinalPhysicalAlgebra := h.2.2.1

theorem admission_requires_allcode_preservation
    (p : PreservationAdmission) (h : PhysicallyAdmitted p) :
    p.allCodeQuantumPreservation := h.2.2.2

/- Countervaluation: valid unitary-model mathematics without an admitted
physical horizon bridge. This is LOGIC, not a physical loss theory. -/
theorem model_proof_alone_does_not_close_cosmic_admission :
    Not (forall p : PreservationAdmission,
      p.unitaryModelProof -> PhysicallyAdmitted p) := by
  intro h
  let p : PreservationAdmission :=
    { unitaryModelProof := True
      eventHorizonPhysicalBridge := False
      completeFinalPhysicalAlgebra := True
      allCodeQuantumPreservation := True }
  have ha : PhysicallyAdmitted p := h p True.intro
  exact ha.2.1

/- A final-state purity property alone does not logically assert code-level
injectivity or a reference-stable quantum decoding channel. -/
structure RadiationClaim where
  pureFinalRadiationForDeclaredFamily : Prop
  arbitraryInputCodeRecoverable : Prop

theorem final_purity_alone_does_not_entail_allcode_recovery :
    Not (forall r : RadiationClaim,
      r.pureFinalRadiationForDeclaredFamily ->
      r.arbitraryInputCodeRecoverable) := by
  intro h
  let r : RadiationClaim :=
    { pureFinalRadiationForDeclaredFamily := True
      arbitraryInputCodeRecoverable := False }
  exact h r True.intro

/- A positive physical law MAY independently close the gate; no-free-
entitlement does not prohibit such a separately earned bridge. -/
theorem independent_warrants_suffice_for_scoped_admission
    (p : PreservationAdmission)
    (hu : p.unitaryModelProof)
    (hh : p.eventHorizonPhysicalBridge)
    (ho : p.completeFinalPhysicalAlgebra)
    (hc : p.allCodeQuantumPreservation) :
    PhysicallyAdmitted p := by
  exact ⟨hu, hh, ho, hc⟩

/- Reopening is local: papers with revised assumptions demand revised
PHYSICAL/DOMAIN adjudication, not automatically SF foundational revision. -/
inductive ReopenCause where
  | matchedPhysicalPreservationProof
  | matchedPhysicalInformationLossProof
  | correctedHorizonBridge
  | revisedCompleteOutputAlgebra
  | counterexampleToLogicalGate
  | counterderivationOfUniversalSF
  deriving DecidableEq, Repr

inductive ReopenLevel where
  | physicalInformationVerdict
  | domainTranslation
  | formalContract
  | universalSF
  deriving DecidableEq, Repr

def reopenAt : ReopenCause -> ReopenLevel
  | .matchedPhysicalPreservationProof => .physicalInformationVerdict
  | .matchedPhysicalInformationLossProof => .physicalInformationVerdict
  | .correctedHorizonBridge => .domainTranslation
  | .revisedCompleteOutputAlgebra => .physicalInformationVerdict
  | .counterexampleToLogicalGate => .formalContract
  | .counterderivationOfUniversalSF => .universalSF

theorem reopening_scope_checkpoint :
    reopenAt .matchedPhysicalPreservationProof =
       ReopenLevel.physicalInformationVerdict /\
    reopenAt .correctedHorizonBridge = ReopenLevel.domainTranslation /\
    reopenAt .counterderivationOfUniversalSF = ReopenLevel.universalSF := by
  simp [reopenAt]

/- Deliberately encoded audit status: model theorem validity is not
synonymous with physical admission; changing these Booleans is not itself
an evidential act. -/
inductive AuditLevel where
  | logicOnly
  | actualBlackHolePreservation
  | actualBlackHoleLoss
  | completeSBRIdentity
  deriving DecidableEq, Repr

def ClosedAt (s : AuditLevel) : Bool :=
  match s with
  | .logicOnly => true
  | _ => false

theorem closure_checkpoint :
    ClosedAt .logicOnly = true /\
    ClosedAt .actualBlackHolePreservation = false /\
    ClosedAt .actualBlackHoleLoss = false /\
    ClosedAt .completeSBRIdentity = false := by
  simp [ClosedAt]

#check admission_requires_horizon_bridge
#check admission_requires_output_completeness
#check admission_requires_allcode_preservation
#check model_proof_alone_does_not_close_cosmic_admission
#check final_purity_alone_does_not_entail_allcode_recovery
#check independent_warrants_suffice_for_scoped_admission
#check reopening_scope_checkpoint
#check closure_checkpoint

end StructuralFlow.BHEH02
/- ==== END BH-EH-02 ==== -/

/- ==== BEGIN BH-EH-04 : BH_EH04_Cross_Input_Admission_Formal_Contract_v0.1_APPEND.lean [SOURCE PRESERVED] ==== -/
/-!
BH-EH-04: CROSS-INPUT QUANTUM-PRESERVATION ADMISSION CONTRACT v0.1
Append after the universal kernel + BH-EH-01 and (if desired) BH-EH-02.
No imports, new axioms, sorry, universe-level SF theorem changes.

IMPORTANT LIMITATION: This proves a finite coefficient-array counterexample
and a PROPOSITIONAL PHYSICAL-ADMISSION DEPENDENCY ONLY. It DOES NOT
machine-prove the Knill-Laflamme QEC theorem, quantum-channel CPTP properties,
event-horizon existence, global physics or an empirical information fate.
The associated Python/NumPy control constructs the real CPTP dephasing channel.
Lean Web compilation of THIS NEW FILE is pending user verification.
-/
namespace StructuralFlow.BHEH04

/- A toy 2x2 coefficient array; raw unnormalized coefficients are
used ONLY to witness cross-input linear-operator distinctions. -/
structure ToyMatrix where
  a00 : Int
  a01 : Int
  a10 : Int
  a11 : Int
  deriving DecidableEq, Repr

def z0 : ToyMatrix := ⟨1, 0, 0, 0⟩
def z1 : ToyMatrix := ⟨0, 0, 0, 1⟩
def plusUnnormalised : ToyMatrix := ⟨1, 1, 1, 1⟩

def toyIdentity (x : ToyMatrix) : ToyMatrix := x

def toyDephase (x : ToyMatrix) : ToyMatrix :=
  ⟨x.a00, 0, 0, x.a11⟩

theorem labels_agree_zero : toyDephase z0 = toyIdentity z0 := by
  decide

theorem labels_agree_one : toyDephase z1 = toyIdentity z1 := by
  decide

theorem superposition_differs :
    toyDephase plusUnnormalised ≠ toyIdentity plusUnnormalised := by
  decide

/- Two maps agreeing on both classical labels need not agree on a
superposition. This demonstrates the necessity of an additional test,
NOT an actual black-hole prediction. -/
theorem two_labels_do_not_determine_full_map :
    ¬ ∀ f g : ToyMatrix → ToyMatrix,
      f z0 = g z0 → f z1 = g z1 →
      f plusUnnormalised = g plusUnnormalised := by
  intro h
  have hp := h toyDephase toyIdentity labels_agree_zero labels_agree_one
  exact superposition_differs hp

/- Every field is an INDEPENDENT proof obligation for a proposed
PHYSICALLY APPLICABLE complete-code preservation claim.
These Prop fields do not assert the physics is already true. -/
structure Submission where
  modelTheorem : Prop
  actualEventHorizon : Prop
  fourDimensionalPhysics : Prop
  physicallyControlledEvolution : Prop
  admittedQuantumInputCode : Prop
  completePhysicalOutput : Prop
  crossInputCodePreservation : Prop
  independentlyEarnedPhysicalBridge : Prop

def PhysicallyAdmitted (s : Submission) : Prop :=
  s.modelTheorem ∧
  s.actualEventHorizon ∧
  s.fourDimensionalPhysics ∧
  s.physicallyControlledEvolution ∧
  s.admittedQuantumInputCode ∧
  s.completePhysicalOutput ∧
  s.crossInputCodePreservation ∧
  s.independentlyEarnedPhysicalBridge

theorem needs_cross_input (s : Submission) (h : PhysicallyAdmitted s) :
    s.crossInputCodePreservation := by
  rcases h with ⟨_, _, _, _, _, _, hc, _⟩
  exact hc

theorem needs_physical_bridge (s : Submission) (h : PhysicallyAdmitted s) :
    s.independentlyEarnedPhysicalBridge := by
  rcases h with ⟨_, _, _, _, _, _, _, hb⟩
  exact hb

theorem model_proof_alone_is_not_physical_admission :
    ¬ ∀ s : Submission, s.modelTheorem → PhysicallyAdmitted s := by
  intro hall
  let s : Submission :=
    { modelTheorem := True
      actualEventHorizon := True
      fourDimensionalPhysics := True
      physicallyControlledEvolution := True
      admittedQuantumInputCode := True
      completePhysicalOutput := True
      crossInputCodePreservation := True
      independentlyEarnedPhysicalBridge := False }
  have ha : PhysicallyAdmitted s := hall s True.intro
  exact needs_physical_bridge s ha

theorem independent_burdens_admit_scoped_claim (s : Submission)
    (h0 : s.modelTheorem)
    (h1 : s.actualEventHorizon)
    (h2 : s.fourDimensionalPhysics)
    (h3 : s.physicallyControlledEvolution)
    (h4 : s.admittedQuantumInputCode)
    (h5 : s.completePhysicalOutput)
    (h6 : s.crossInputCodePreservation)
    (h7 : s.independentlyEarnedPhysicalBridge) :
    PhysicallyAdmitted s := by
  exact ⟨h0, h1, h2, h3, h4, h5, h6, h7⟩

/- Reopening is localized. Physical preservation being earned need not
refute the universal SF non-guarantee theorem. -/
inductive ReopenSurface where
  | earnedActualGlobalPreservation
  | earnedActualCompleteOutputLoss
  | correctedEventHorizonIdentity
  | revisedPhysicalOutputRegistry
  | brokenCrossInputMathematicalClaim
  | defeatedSFUniversalPremise
  deriving DecidableEq, Repr

inductive ReopenLevel where
  | physicalInformationVerdict
  | domainTranslation
  | formalContract
  | universalSF
  deriving DecidableEq, Repr

def reopenAt : ReopenSurface → ReopenLevel
  | .earnedActualGlobalPreservation => .physicalInformationVerdict
  | .earnedActualCompleteOutputLoss => .physicalInformationVerdict
  | .correctedEventHorizonIdentity => .domainTranslation
  | .revisedPhysicalOutputRegistry => .physicalInformationVerdict
  | .brokenCrossInputMathematicalClaim => .formalContract
  | .defeatedSFUniversalPremise => .universalSF

theorem reopen_locality_checkpoint :
    reopenAt .earnedActualGlobalPreservation = .physicalInformationVerdict ∧
    reopenAt .correctedEventHorizonIdentity = .domainTranslation ∧
    reopenAt .defeatedSFUniversalPremise = .universalSF := by
  simp [reopenAt]

#check labels_agree_zero
#check labels_agree_one
#check superposition_differs
#check two_labels_do_not_determine_full_map
#check needs_cross_input
#check needs_physical_bridge
#check model_proof_alone_is_not_physical_admission
#check independent_burdens_admit_scoped_claim
#check reopen_locality_checkpoint

end StructuralFlow.BHEH04
/- ==== END BH-EH-04 ==== -/

/- ==== BEGIN BH-EH-05 : BH_EH05_Conditional_Preservation_Admission_v0.1_APPEND.lean [SOURCE PRESERVED] ==== -/
/-!
BH-EH-05 — strongest-positive-claim premise admission ledger (append-only)
Lean 4, stand-alone namespace; append after the unchanged universal kernel.
No imports, sorry or new axioms. Does NOT prove quantum gravity, physical
nonperturbative completeness, or actual black-hole information fate.

Theorem names use 'conditional' deliberately. Physical predicates are formal
propositions that must be EARNED externally; definitions cannot supply evidence.
Compilation not yet verified in Lean Web.
-/
namespace StructuralFlow.BHEH05

/- Defeater logic abstracted from a Marolf-style asymptotic argument.
'proof' is a premise supplied by the relevant physical theorem;
Lean is NOT deriving it from general GR dynamics. -/
structure FlatGravityTarget where
  eventHorizon : Prop
  fourDimensional : Prop
  completePhysicalOutput : Prop
  crossInputPreservation : Prop
  nonperturbativeCompleteness : Prop
  asymptoticControl : Prop
  independentlyEarnedPhysicalBridge : Prop
  globallyUnitary : Prop

/- This is the admission rule for a PHYSICAL complete-preservation claim.
The last field is the conclusion to be independently proved, not postulated
as a definition of information in the cosmos. -/
def PhysicallyAdmitted (t : FlatGravityTarget) : Prop :=
  t.eventHorizon ∧
  t.fourDimensional ∧
  t.completePhysicalOutput ∧
  t.crossInputPreservation ∧
  t.nonperturbativeCompleteness ∧
  t.asymptoticControl ∧
  t.independentlyEarnedPhysicalBridge ∧
  t.globallyUnitary

theorem physical_admission_needs_independent_bridge (t : FlatGravityTarget)
    (h : PhysicallyAdmitted t) : t.independentlyEarnedPhysicalBridge := by
  rcases h with ⟨_, _, _, _, _, _, hb, _⟩
  exact hb

theorem physical_admission_needs_cross_input (t : FlatGravityTarget)
    (h : PhysicallyAdmitted t) : t.crossInputPreservation := by
  rcases h with ⟨_, _, _, hc, _, _, _, _⟩
  exact hc

theorem physical_admission_needs_complete_output (t : FlatGravityTarget)
    (h : PhysicallyAdmitted t) : t.completePhysicalOutput := by
  rcases h with ⟨_, _, ho, _, _, _, _, _⟩
  exact ho

/- Marolf-style disjunction becomes U only when the contrasting
'asymptotic failure' branch is independently ruled out. -/
theorem conditional_dichotomy_yields_unitarity
    (unitary asymptoticControl : Prop)
    (hDichotomy : unitary ∨ ¬asymptoticControl)
    (hAsymptotic : asymptoticControl) : unitary := by
  rcases hDichotomy with hu | hn
  · exact hu
  · exact False.elim (hn hAsymptotic)

/- The disjunction alone does NOT logically establish unitarity. -/
theorem disjunction_alone_cannot_guarantee_unitarity :
    ¬ ∀ unitary asymptoticControl : Prop,
      (unitary ∨ ¬asymptoticControl) → unitary := by
  intro h
  have hf : False := h False False (Or.inr (fun x => x))
  exact hf

/- Restricted-access irreversibility (cutIsometry = false) does not
imply global information loss (globalUnitary = false). -/
theorem restricted_cut_nonunitarity_does_not_imply_global_loss :
    ¬ ∀ globalUnitary cutIsometric : Bool,
       cutIsometric = false → globalUnitary = false := by
  intro h
  have contra : true = false := h true false rfl
  cases contra

/- A model theorem, even when true, cannot close a distinct missing
physical bridge under this independently specified admission contract. -/
theorem model_proof_without_physical_bridge_not_admitted :
    ¬ ∀ (t : FlatGravityTarget),
      t.globallyUnitary → PhysicallyAdmitted t := by
  intro h
  let t : FlatGravityTarget := {
    eventHorizon := True
    fourDimensional := True
    completePhysicalOutput := True
    crossInputPreservation := True
    nonperturbativeCompleteness := True
    asymptoticControl := True
    independentlyEarnedPhysicalBridge := False
    globallyUnitary := True
  }
  have admitted : PhysicallyAdmitted t := h t True.intro
  exact physical_admission_needs_independent_bridge t admitted

/- Reopening locations are typed, not empirical assertions. -/
inductive ReopenCase where
  | physicallyEarnedNonperturbativeCompleteness
  | completeOutputCrossInputPreservation
  | demonstratedPhysicalInformationLoss
  | eventHorizonRouteTranslationDefeated
  | universalHingeCounterderivation
  deriving DecidableEq

inductive ReopenLevel where
  | physicalPreservationVerdict
  | blackHoleDomainTranslation
  | universalStructuralFlow
  deriving DecidableEq

def reopenAt : ReopenCase → ReopenLevel
  | .physicallyEarnedNonperturbativeCompleteness => .physicalPreservationVerdict
  | .completeOutputCrossInputPreservation => .physicalPreservationVerdict
  | .demonstratedPhysicalInformationLoss => .physicalPreservationVerdict
  | .eventHorizonRouteTranslationDefeated => .blackHoleDomainTranslation
  | .universalHingeCounterderivation => .universalStructuralFlow

theorem reopening_checkpoint :
   reopenAt .completeOutputCrossInputPreservation = .physicalPreservationVerdict ∧
   reopenAt .eventHorizonRouteTranslationDefeated = .blackHoleDomainTranslation ∧
   reopenAt .universalHingeCounterderivation = .universalStructuralFlow := by
  decide

#check physical_admission_needs_independent_bridge
#check physical_admission_needs_cross_input
#check physical_admission_needs_complete_output
#check conditional_dichotomy_yields_unitarity
#check disjunction_alone_cannot_guarantee_unitarity
#check restricted_cut_nonunitarity_does_not_imply_global_loss
#check model_proof_without_physical_bridge_not_admitted
#check reopening_checkpoint

end StructuralFlow.BHEH05
/- ==== END BH-EH-05 ==== -/

/- ==== BEGIN BH-EH-06 : BH_EH06_Cut_Algebra_Admission_v0.1_APPEND.lean [SOURCE PRESERVED] ==== -/
/-!
BH-EH-06 — abstract cut-algebra monotonicity and physical-admission contract.
Stand-alone Lean 4 code. Append AFTER the unchanged SF universal kernel.
No imports, new axioms, sorry, or quantum-gravity empirical assertions.
This proves an ABSTRACT access monotonicity and tests the admission grammar,
NOT that physical null-infinity operators exist or that actual black holes
preserve/destroy information. Compile in Lean Web before machine-closure claim.
-/
namespace StructuralFlow.BHEH06

/- A model of accessible quantum-observation outcomes. The availability
predicate is an abstract set of observables, not a proved von Neumann algebra. -/
structure CutAccess (State Obs : Type) where
  available : Nat → Obs → Prop
  response : State → Obs → Bool
  nesting : ∀ (early later : Nat) (o : Obs),
    early ≤ later → available later o → available early o

def SeparatedAt {State Obs : Type} (c : CutAccess State Obs)
    (cut : Nat) (a b : State) : Prop :=
  ∃ o : Obs, c.available cut o ∧ c.response a o ≠ c.response b o

theorem earlier_cut_inherits_later_distinction {State Obs : Type}
    (c : CutAccess State Obs) (early later : Nat) (a b : State)
    (horder : early ≤ later) (h : SeparatedAt c later a b) :
    SeparatedAt c early a b := by
  rcases h with ⟨o, havail, hdiff⟩
  exact ⟨o, c.nesting early later o horder havail, hdiff⟩

/- The earlier algebra may be larger than the later algebra without
anything whatsoever being said about fundamental global information loss. -/
inductive FinObs where
  | identity
  | phaseWitness
  deriving DecidableEq

def earlyAvailable (_ : FinObs) : Prop := True

def lateAvailable : FinObs → Prop
  | .identity => True
  | .phaseWitness => False

theorem late_observables_in_early (o : FinObs) :
    lateAvailable o → earlyAvailable o := by
  intro _
  exact True.intro

theorem strict_access_example :
    earlyAvailable .phaseWitness ∧ ¬ lateAvailable .phaseWitness := by
  simp [earlyAvailable, lateAvailable]

/- The physical target is a literal EH in a real 4D forming evaporating
black hole; these propositions are OPEN evidentiary premises, not facts. -/
structure PhysicalSubmission where
  eventHorizon : Prop
  fourDimensional : Prop
  formationAndEndpoint : Prop
  commonStateSector : Prop
  regulatedCutOperator : Prop
  selfAdjointCommonDomain : Prop
  gaugeAndAlgebraMatched : Prop
  crossInputQuantumPreservation : Prop
  completePhysicalOutput : Prop
  independentCosmosBridge : Prop
  modelCutNesting : Prop

def MatchedAlgebraAdmitted (s : PhysicalSubmission) : Prop :=
  s.commonStateSector ∧
  s.regulatedCutOperator ∧
  s.selfAdjointCommonDomain ∧
  s.gaugeAndAlgebraMatched

def PhysicallyAdmittedPreservation (s : PhysicalSubmission) : Prop :=
  MatchedAlgebraAdmitted s ∧
  s.eventHorizon ∧
  s.fourDimensional ∧
  s.formationAndEndpoint ∧
  s.crossInputQuantumPreservation ∧
  s.completePhysicalOutput ∧
  s.independentCosmosBridge

theorem matched_algebra_needs_common_domain (s : PhysicalSubmission)
    (h : MatchedAlgebraAdmitted s) : s.selfAdjointCommonDomain := by
  exact h.2.2.1

theorem physical_preservation_needs_cosmos_bridge (s : PhysicalSubmission)
    (h : PhysicallyAdmittedPreservation s) : s.independentCosmosBridge := by
  exact h.2.2.2.2.2.2

/- A true abstract nesting statement does not logically supply the missing
physical operator admission or a complete physical channel. -/
theorem cut_nesting_alone_not_physical_preservation :
    ¬ ∀ s : PhysicalSubmission,
       s.modelCutNesting → PhysicallyAdmittedPreservation s := by
  intro h
  let s : PhysicalSubmission := {
    eventHorizon := True
    fourDimensional := True
    formationAndEndpoint := True
    commonStateSector := True
    regulatedCutOperator := False
    selfAdjointCommonDomain := True
    gaugeAndAlgebraMatched := True
    crossInputQuantumPreservation := True
    completePhysicalOutput := True
    independentCosmosBridge := True
    modelCutNesting := True
  }
  have hadm : PhysicallyAdmittedPreservation s := h s True.intro
  have halg : MatchedAlgebraAdmitted s := hadm.1
  exact halg.2.1

inductive ReopenSurface where
  | regulatedBondiGeneratorConstructed
  | commonRepresentationCounterstate
  | globalPhysicalPreservationEarned
  | physicalGlobalLossEarned
  | eventHorizonRouteBridgeDefeated
  | universalSFTheoremDefeated
  deriving DecidableEq

inductive ReopenLevel where
  | modelOperatorAdmission
  | physicalInformationVerdict
  | eventHorizonDomainTranslation
  | universalSF
  deriving DecidableEq

def reopenAt : ReopenSurface → ReopenLevel
  | .regulatedBondiGeneratorConstructed => .modelOperatorAdmission
  | .commonRepresentationCounterstate => .modelOperatorAdmission
  | .globalPhysicalPreservationEarned => .physicalInformationVerdict
  | .physicalGlobalLossEarned => .physicalInformationVerdict
  | .eventHorizonRouteBridgeDefeated => .eventHorizonDomainTranslation
  | .universalSFTheoremDefeated => .universalSF

theorem reopening_scope_checkpoint :
    reopenAt .regulatedBondiGeneratorConstructed = .modelOperatorAdmission ∧
    reopenAt .globalPhysicalPreservationEarned = .physicalInformationVerdict ∧
    reopenAt .eventHorizonRouteBridgeDefeated = .eventHorizonDomainTranslation ∧
    reopenAt .universalSFTheoremDefeated = .universalSF := by
  decide

#check earlier_cut_inherits_later_distinction
#check late_observables_in_early
#check strict_access_example
#check matched_algebra_needs_common_domain
#check physical_preservation_needs_cosmos_bridge
#check cut_nesting_alone_not_physical_preservation
#check reopening_scope_checkpoint

end StructuralFlow.BHEH06
/- ==== END BH-EH-06 ==== -/

/- ==== BEGIN BH-EH-07 : BH_EH07_Regulated_Reconstruction_Admission_v0.1_APPEND.lean [SOURCE PRESERVED] ==== -/
/-!
BH-EH-07 - Regulated boundary observable reconstruction admission contract.
Append under UNCHANGED Universal Kernel in Lean Web. Standalone namespace.
This module proves only conditional admission grammar and finite discrete
probability-support control. It does NOT construct a quantum Bondi operator,
prove von Neumann reconstruction or certify cosmic information preservation.
No new axioms; no sorry. Requires Lean Web compiler validation before CLOSE.
-/
namespace StructuralFlow.BHEH07

/- All fields below are obligations, not alleged established physical truths. -/
structure Candidate where
  samePhysicalRepresentation : Prop
  regulatedBondiGenerator : Prop
  commonInvariantDenseDomain : Prop
  selfAdjointness : Prop
  regulatorAndLimitControl : Prop
  exponentialsActOnAlgebra : Prop
  formalCommutatorCorrespondence : Prop
  gravitationalDressingMatched : Prop
  fullQuantumStateSeparation : Prop
  recoveryChannelExists : Prop
  formationEventHorizon : Prop
  fourDimensionalDynamics : Prop
  completeEvaporation : Prop
  completePhysicalOutput : Prop
  independentlyEarnedCosmosBridge : Prop

/- Regulator / operator admission precedes any claim of boundary reconstruction. -/
def OperatorAdmitted (s : Candidate) : Prop :=
  s.samePhysicalRepresentation ∧ s.regulatedBondiGenerator ∧
  s.commonInvariantDenseDomain ∧ s.selfAdjointness ∧
  s.regulatorAndLimitControl ∧ s.exponentialsActOnAlgebra ∧
  s.formalCommutatorCorrespondence ∧ s.gravitationalDressingMatched

def SeparationAdmitted (s : Candidate) : Prop :=
  OperatorAdmitted s ∧ s.fullQuantumStateSeparation

/- Recovery is a separate condition, not a synonym for state separation. -/
def QuantumRecoveryAdmitted (s : Candidate) : Prop :=
  SeparationAdmitted s ∧ s.recoveryChannelExists

def PhysicalGlobalPreservationAdmitted (s : Candidate) : Prop :=
  QuantumRecoveryAdmitted s ∧ s.formationEventHorizon ∧
  s.fourDimensionalDynamics ∧ s.completeEvaporation ∧
  s.completePhysicalOutput ∧ s.independentlyEarnedCosmosBridge

theorem admitted_operator_needs_self_adjointness (s : Candidate)
    (h : OperatorAdmitted s) : s.selfAdjointness := by
  rcases h with ⟨_, _, _, hs, _, _, _, _⟩
  exact hs

theorem admitted_operator_needs_controlled_exponentiation (s : Candidate)
    (h : OperatorAdmitted s) : s.exponentialsActOnAlgebra := by
  rcases h with ⟨_, _, _, _, _, he, _, _⟩
  exact he

theorem recovery_requires_more_than_separation (s : Candidate)
    (h : QuantumRecoveryAdmitted s) : s.recoveryChannelExists := by
  exact h.2

theorem physical_claim_needs_complete_output (s : Candidate)
    (h : PhysicalGlobalPreservationAdmitted s) : s.completePhysicalOutput := by
  rcases h with ⟨_, _, _, _, ho, _⟩
  exact ho

theorem physical_claim_needs_independent_bridge (s : Candidate)
    (h : PhysicalGlobalPreservationAdmitted s) :
    s.independentlyEarnedCosmosBridge := by
  rcases h with ⟨_, _, _, _, _, hb⟩
  exact hb

/- A countermodel in the PROPOSITIONAL admission grammar: even assuming
all upstream checks and full separation, exact recovery is not inherited. -/
theorem separation_alone_does_not_admit_recovery :
    ¬ (∀ s : Candidate, SeparationAdmitted s → QuantumRecoveryAdmitted s) := by
  intro h
  let s : Candidate := {
    samePhysicalRepresentation := True
    regulatedBondiGenerator := True
    commonInvariantDenseDomain := True
    selfAdjointness := True
    regulatorAndLimitControl := True
    exponentialsActOnAlgebra := True
    formalCommutatorCorrespondence := True
    gravitationalDressingMatched := True
    fullQuantumStateSeparation := True
    recoveryChannelExists := False
    formationEventHorizon := True
    fourDimensionalDynamics := True
    completeEvaporation := True
    completePhysicalOutput := True
    independentlyEarnedCosmosBridge := True
  }
  have hs : SeparationAdmitted s := by
    simp [SeparationAdmitted, OperatorAdmitted, s]
  have hr : QuantumRecoveryAdmitted s := h s hs
  exact hr.2

/- A tiny noisy binary classical channel with overlapping output supports.
Distinct input labels yield distinct probabilities, but no deterministic
postprocessor can recover input with certainty on every possible output.
Quantum non-recoverability is checked SEPARATELY by the NumPy control and
standard trace-distance contractivity, not by these Bool lemmas. -/
def weight (input output : Bool) : Nat :=
  if input = output then 3 else 1

theorem noisy_labels_statistically_distinguishable :
    weight false false ≠ weight true false := by
  decide

def CanOutput (_input _outcome : Bool) : Prop := True

def PerfectDecoder (decoder : Bool → Bool) : Prop :=
  ∀ input outcome : Bool, CanOutput input outcome → decoder outcome = input

theorem overlapping_support_forbids_perfect_decoder :
    ¬ ∃ decoder : Bool → Bool, PerfectDecoder decoder := by
  intro h
  rcases h with ⟨decoder, hd⟩
  have h0 : decoder false = false := hd false false True.intro
  have h1 : decoder false = true := hd true false True.intro
  rw [h0] at h1
  cases h1

inductive ReopenSurface where
  | validSelfAdjointOperatorConstructed
  | validRegulatedReconstructionCompleted
  | crossInputRecoveryEarned
  | matchedStateCounterexample
  | fullPhysicalPreservationEstablished
  | physicalGlobalLossEstablished
  | eventHorizonSFBridgeDefeated
  | foundationalSFTheoremDefeated
  deriving DecidableEq

inductive ReopenLevel where
  | operatorAdmission
  | modelReconstruction
  | codeRecovery
  | physicalInformationVerdict
  | eventHorizonDomainTranslation
  | universalSF
  deriving DecidableEq

def reopenAt : ReopenSurface → ReopenLevel
  | .validSelfAdjointOperatorConstructed => .operatorAdmission
  | .validRegulatedReconstructionCompleted => .modelReconstruction
  | .crossInputRecoveryEarned => .codeRecovery
  | .matchedStateCounterexample => .modelReconstruction
  | .fullPhysicalPreservationEstablished => .physicalInformationVerdict
  | .physicalGlobalLossEstablished => .physicalInformationVerdict
  | .eventHorizonSFBridgeDefeated => .eventHorizonDomainTranslation
  | .foundationalSFTheoremDefeated => .universalSF

theorem reopening_locality_checkpoint :
    reopenAt .validSelfAdjointOperatorConstructed = .operatorAdmission ∧
    reopenAt .validRegulatedReconstructionCompleted = .modelReconstruction ∧
    reopenAt .crossInputRecoveryEarned = .codeRecovery ∧
    reopenAt .fullPhysicalPreservationEstablished = .physicalInformationVerdict ∧
    reopenAt .eventHorizonSFBridgeDefeated = .eventHorizonDomainTranslation ∧
    reopenAt .foundationalSFTheoremDefeated = .universalSF := by
  decide

#check admitted_operator_needs_self_adjointness
#check admitted_operator_needs_controlled_exponentiation
#check recovery_requires_more_than_separation
#check physical_claim_needs_complete_output
#check physical_claim_needs_independent_bridge
#check separation_alone_does_not_admit_recovery
#check noisy_labels_statistically_distinguishable
#check overlapping_support_forbids_perfect_decoder
#check reopening_locality_checkpoint

end StructuralFlow.BHEH07
/- ==== END BH-EH-07 ==== -/

/- ==== BEGIN BH-EH-08 : BH_EH08_Recovery_Physical_Admission_v0.2_APPEND.lean [SOURCE PRESERVED] ==== -/
/-!
BH-EH-08 — Recovery and physical-admission logic, v0.2.
Append BELOW the unchanged universal kernel, independent of other BHEH modules.
This is a FINITE LOGICAL CONTRACT. It does NOT prove the physical recovery
of any quantum information in an actual gravitational black hole.
No new axiom and no `sorry` is used.
-/

namespace StructuralFlow.BHEH08

structure RecoverySubmission where
  gravitationalOperatorAdmitted : Bool
  validIslandOrEquivalentEncoding : Bool
  commonCodeAndReference : Bool
  quantifiedQuantumRecovery : Bool
  nonperturbativeAccuracyControlled : Bool
  actual4DEventHorizonEvaporation : Bool
  physicallyCompleteFinalOutput : Bool
  independentlyEarnedCosmosBridge : Bool
  independentlyProvedCompleteDynamics : Bool
  allClaimedInputsRecoveredFromCompleteOutput : Bool
  deriving DecidableEq, Repr

def ScopedRecoveryAdmitted (s : RecoverySubmission) : Prop :=
  s.gravitationalOperatorAdmitted = true ∧
  s.validIslandOrEquivalentEncoding = true ∧
  s.commonCodeAndReference = true ∧
  s.quantifiedQuantumRecovery = true

/- A complete physical preservation theorem has TWO possible routes:
   direct independently proved complete evolution, OR sufficiently complete
   quantum recovery. Radiation-code recovery alone is NOT necessary for
   global unitarity, nor is it sufficient without full-output coverage. -/
def PhysicalGlobalPreservationAdmitted (s : RecoverySubmission) : Prop :=
  s.nonperturbativeAccuracyControlled = true ∧
  s.actual4DEventHorizonEvaporation = true ∧
  s.physicallyCompleteFinalOutput = true ∧
  s.independentlyEarnedCosmosBridge = true ∧
  (s.independentlyProvedCompleteDynamics = true ∨
   (ScopedRecoveryAdmitted s ∧
    s.allClaimedInputsRecoveredFromCompleteOutput = true))

theorem scoped_recovery_requires_cross_input (s : RecoverySubmission)
    (h : ScopedRecoveryAdmitted s) : s.commonCodeAndReference = true := h.2.2.1

theorem scoped_recovery_requires_quantified_decoder (s : RecoverySubmission)
    (h : ScopedRecoveryAdmitted s) : s.quantifiedQuantumRecovery = true := h.2.2.2

theorem physical_preservation_requires_nonperturbative_control
    (s : RecoverySubmission) (h : PhysicalGlobalPreservationAdmitted s) :
    s.nonperturbativeAccuracyControlled = true := h.1

theorem physical_preservation_requires_complete_output
    (s : RecoverySubmission) (h : PhysicalGlobalPreservationAdmitted s) :
    s.physicallyCompleteFinalOutput = true := h.2.2.1

theorem physical_preservation_requires_cosmos_bridge
    (s : RecoverySubmission) (h : PhysicalGlobalPreservationAdmitted s) :
    s.independentlyEarnedCosmosBridge = true := h.2.2.2.1

private def controlledModelNotCosmos : RecoverySubmission :=
  { gravitationalOperatorAdmitted := true
    validIslandOrEquivalentEncoding := true
    commonCodeAndReference := true
    quantifiedQuantumRecovery := true
    nonperturbativeAccuracyControlled := false
    actual4DEventHorizonEvaporation := false
    physicallyCompleteFinalOutput := false
    independentlyEarnedCosmosBridge := false
    independentlyProvedCompleteDynamics := false
    allClaimedInputsRecoveredFromCompleteOutput := false }

theorem scoped_recovery_alone_does_not_earn_cosmic_preservation :
    ¬ ∀ s : RecoverySubmission,
      ScopedRecoveryAdmitted s → PhysicalGlobalPreservationAdmitted s := by
  intro h
  have hs : ScopedRecoveryAdmitted controlledModelNotCosmos := by
    simp [ScopedRecoveryAdmitted, controlledModelNotCosmos]
  have hp : PhysicalGlobalPreservationAdmitted controlledModelNotCosmos :=
    h controlledModelNotCosmos hs
  have hn : ¬ PhysicalGlobalPreservationAdmitted controlledModelNotCosmos := by
    simp [PhysicalGlobalPreservationAdmitted, controlledModelNotCosmos]
  exact hn hp

theorem directly_earned_complete_dynamics_admits_physical_claim
    (s : RecoverySubmission)
    (h1 : s.nonperturbativeAccuracyControlled = true)
    (h2 : s.actual4DEventHorizonEvaporation = true)
    (h3 : s.physicallyCompleteFinalOutput = true)
    (h4 : s.independentlyEarnedCosmosBridge = true)
    (h5 : s.independentlyProvedCompleteDynamics = true) :
    PhysicalGlobalPreservationAdmitted s := by
  exact ⟨h1, h2, h3, h4, Or.inl h5⟩

theorem complete_output_recovery_admits_physical_claim
    (s : RecoverySubmission)
    (h0 : ScopedRecoveryAdmitted s)
    (h1 : s.nonperturbativeAccuracyControlled = true)
    (h2 : s.actual4DEventHorizonEvaporation = true)
    (h3 : s.physicallyCompleteFinalOutput = true)
    (h4 : s.independentlyEarnedCosmosBridge = true)
    (h5 : s.allClaimedInputsRecoveredFromCompleteOutput = true) :
    PhysicalGlobalPreservationAdmitted s := by
  exact ⟨h1, h2, h3, h4, Or.inr ⟨h0, h5⟩⟩

inductive ReopenSurface where
  | newModelCodeRecovery
  | fullyWarrantedPhysicalPreservation
  | physicallyCompleteInformationLoss
  | eventHorizonTranslationDefeated
  | universalSFCounterderivation
  deriving DecidableEq, Repr

inductive ReopenLevel where
  | modelCodeRecovery
  | domainPhysicalInformationVerdict
  | eventHorizonDomainTranslation
  | universalSF
  deriving DecidableEq, Repr

def reopenAt : ReopenSurface → ReopenLevel
  | .newModelCodeRecovery => .modelCodeRecovery
  | .fullyWarrantedPhysicalPreservation => .domainPhysicalInformationVerdict
  | .physicallyCompleteInformationLoss => .domainPhysicalInformationVerdict
  | .eventHorizonTranslationDefeated => .eventHorizonDomainTranslation
  | .universalSFCounterderivation => .universalSF

theorem reopening_locality_checkpoint :
    reopenAt .newModelCodeRecovery = .modelCodeRecovery ∧
    reopenAt .fullyWarrantedPhysicalPreservation = .domainPhysicalInformationVerdict ∧
    reopenAt .physicallyCompleteInformationLoss = .domainPhysicalInformationVerdict ∧
    reopenAt .eventHorizonTranslationDefeated = .eventHorizonDomainTranslation ∧
    reopenAt .universalSFCounterderivation = .universalSF := by
  decide

#check scoped_recovery_requires_cross_input
#check scoped_recovery_requires_quantified_decoder
#check physical_preservation_requires_nonperturbative_control
#check physical_preservation_requires_complete_output
#check physical_preservation_requires_cosmos_bridge
#check scoped_recovery_alone_does_not_earn_cosmic_preservation
#check directly_earned_complete_dynamics_admits_physical_claim
#check complete_output_recovery_admits_physical_claim
#check reopening_locality_checkpoint

end StructuralFlow.BHEH08
/- ==== END BH-EH-08 ==== -/

/-! BH-EH: INTEGRATED OBJECT CHARTER AND CROSS-MODULE CHECKS
This NEW layer connects previously independent contracts without pretending
that a physical black hole has been instantiated in Lean.
-/
namespace StructuralFlow.BHEHIntegrated

/- Object identity: one selected ordinary causal route from STRICTLY INSIDE
an actual black-hole event horizon to the exterior future, PLUS independent
physical-completion obligations for any asserted cosmic information fate.
The route assumptions below are already premises of BHEH01, not GR derivations.
These Prop fields are AUDIT OBLIGATIONS; they are not data/evidence. -/
structure EventHorizonObject (Route : Type) where
  horizonInterface : StructuralFlow.BHEH01.HorizonRouteInterface Route
  selectedOutwardRoute : Route
  selectedRouteIsOutward : horizonInterface.outward selectedOutwardRoute
  actualFourDimensionalEventHorizon : Prop
  completePhysicalEvaporation : Prop
  completeFinalObservableAlgebra : Prop
  independentlyEarnedCosmosBridge : Prop

/- The model target is PHYSICALLY admitted only if these propositions receive
separate evidential justification. Constructing an EventHorizonObject does not
provide proofs of any of them. -/
def PhysicalTargetAdmitted {Route : Type}
    (t : EventHorizonObject Route) : Prop :=
  t.actualFourDimensionalEventHorizon ∧
  t.completePhysicalEvaporation ∧
  t.completeFinalObservableAlgebra ∧
  t.independentlyEarnedCosmosBridge

/- Positive logical closure: if the stated horizon-route premises hold,
ordinary outward Cascade and its downstream Authorization are blocked.
This says NOTHING about locally functioning interior routes, quantum boundary
correlations, or the fate of the complete physical quantum state. -/
theorem integrated_outward_route_closure {Route : Type}
    (t : EventHorizonObject Route) :
    ¬ t.horizonInterface.cascade t.selectedOutwardRoute ∧
    ¬ t.horizonInterface.authorization t.selectedOutwardRoute := by
  exact StructuralFlow.BHEH01.route_closure
    t.horizonInterface t.selectedOutwardRoute t.selectedRouteIsOutward

/- Exact minimal-model NON-ENTAILMENT: horizon pattern alone supplies neither
physical unitarity nor physical loss, even if it bounds ordinary outward
Cascade. The witnesses are FORMAL logical completions, NOT black holes. -/
theorem minimal_horizon_pattern_leaves_both_fates_open :
    (¬ ∀ m : StructuralFlow.BHEH01.LogicalCompletion,
      StructuralFlow.BHEH01.HorizonSFPattern m →
      m.globalQuantumPreservation = true) ∧
    (¬ ∀ m : StructuralFlow.BHEH01.LogicalCompletion,
      StructuralFlow.BHEH01.HorizonSFPattern m →
      m.globalQuantumPreservation = false) := by
  exact ⟨StructuralFlow.BHEH01.horizon_pattern_does_not_entail_global_preservation,
    StructuralFlow.BHEH01.horizon_pattern_does_not_entail_global_loss⟩

/- A complete, independently established physical preservation claim is
admissible by either a complete-dynamics route OR complete-output quantum
recovery under the separately specified BHEH08 requirements. This contract
never requires radiation-only recovery as the unique proof path. -/
theorem independently_earned_preservation_is_admissible
    (s : StructuralFlow.BHEH08.RecoverySubmission)
    (h0 : s.nonperturbativeAccuracyControlled = true)
    (h1 : s.actual4DEventHorizonEvaporation = true)
    (h2 : s.physicallyCompleteFinalOutput = true)
    (h3 : s.independentlyEarnedCosmosBridge = true)
    (h4 : s.independentlyProvedCompleteDynamics = true) :
    StructuralFlow.BHEH08.PhysicalGlobalPreservationAdmitted s := by
  exact StructuralFlow.BHEH08.directly_earned_complete_dynamics_admits_physical_claim
    s h0 h1 h2 h3 h4

/- A positive model-level quantum reconstruction result may be credited while
failing to complete the independently specified cosmic-admission predicates. -/
theorem scoped_recovery_is_not_automatically_global_preservation :
    ¬ ∀ s : StructuralFlow.BHEH08.RecoverySubmission,
      StructuralFlow.BHEH08.ScopedRecoveryAdmitted s →
      StructuralFlow.BHEH08.PhysicalGlobalPreservationAdmitted s := by
  exact StructuralFlow.BHEH08.scoped_recovery_alone_does_not_earn_cosmic_preservation

/- The object and burden are frozen. Final information fate is NOT thereby
awarded. This Boolean registry is AUDIT METADATA, not evidence. -/
inductive ClaimSeat where
  | logicalHorizonRouteClosure
  | exactPhysicalHorizonInstantiation
  | completeSBRDensityThresholdIdentity
  | nonperturbativeCompleteEvaporation
  | physicalGlobalPreservation
  | physicalGlobalLoss
  deriving DecidableEq, Repr

def ClosureRegistered : ClaimSeat → Bool
  | .logicalHorizonRouteClosure => true
  | _ => false

theorem integrated_closure_boundary :
    ClosureRegistered .logicalHorizonRouteClosure = true ∧
    ClosureRegistered .exactPhysicalHorizonInstantiation = false ∧
    ClosureRegistered .completeSBRDensityThresholdIdentity = false ∧
    ClosureRegistered .nonperturbativeCompleteEvaporation = false ∧
    ClosureRegistered .physicalGlobalPreservation = false ∧
    ClosureRegistered .physicalGlobalLoss = false := by
  decide

/- Reopening is local to the challenged burden. A previously missing
physical preservation proof changes a physical verdict, not SF theorem truth.
No global NOT-preserved claim is proved by these local facts. -/
inductive ReopenTrigger where
  | actualHorizonRouteBridgeDefeated
  | disputedOperatorOrReconstructionRepaired
  | physicalQuantumPreservationEarned
  | physicalQuantumLossEarned
  | originalFormalCounterexampleDefeated
  | foundationalSFDerivationDefeated
  deriving DecidableEq, Repr

inductive ReopenSeat where
  | domainTranslation
  | modelOrContractProof
  | physicalInformationVerdict
  | universalSF
  deriving DecidableEq, Repr

def reopenAt : ReopenTrigger → ReopenSeat
  | .actualHorizonRouteBridgeDefeated => .domainTranslation
  | .disputedOperatorOrReconstructionRepaired => .modelOrContractProof
  | .physicalQuantumPreservationEarned => .physicalInformationVerdict
  | .physicalQuantumLossEarned => .physicalInformationVerdict
  | .originalFormalCounterexampleDefeated => .modelOrContractProof
  | .foundationalSFDerivationDefeated => .universalSF

theorem integrated_reopening_checkpoint :
    reopenAt .actualHorizonRouteBridgeDefeated = .domainTranslation ∧
    reopenAt .physicalQuantumPreservationEarned = .physicalInformationVerdict ∧
    reopenAt .physicalQuantumLossEarned = .physicalInformationVerdict ∧
    reopenAt .foundationalSFDerivationDefeated = .universalSF := by
  decide

#check integrated_outward_route_closure
#check minimal_horizon_pattern_leaves_both_fates_open
#check independently_earned_preservation_is_admissible
#check scoped_recovery_is_not_automatically_global_preservation
#check integrated_closure_boundary
#check integrated_reopening_checkpoint

end StructuralFlow.BHEHIntegrated
