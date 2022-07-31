\version "2.23.10"
#(set-global-staff-size 17)

\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "poly-mark-engraver223.ly"
\include "BookPartPagesJAS223.ly"
\include "MRB223.ly"
% \include "twoCompoundMetersJAS223.ly"
% \include "staffColor.ly"
%\include "Bass_changes_equal_root223.ly"
%\include "enHarmoniszeChordsName.ly"

title = #"Shadow"
composer = #"Chris Potter"
meter = #"(Med. Swing)"
kwtempo = #"Medium"
kwstyle = #"Swing"
global = { \key des \major \time 6/4 }

\paper {
  indent = 0\mm
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
  system-system-spacing = #'((basic-distance . 15)
                             (minimum-distance . 12)
                             (padding . 0))
}

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\layout {
  \context {
    \Staff
    \override KeyCancellation.break-visibility = #all-invisible
    explicitKeySignatureVisibility = #end-of-line-invisible
  }
}
  \header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  asplayed = #"Chris Potter" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=ZOctdL_ugRU"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

message = \markup ""

voltaAdLib = \markup { \text \fontsize #5 { vamp till cue } }
voltaOnCue= \markup  { \text \fontsize #5 { On Cue } }


Ossature = {
  \global
  \polyMark #'cu \markup { \box Intro }
  s1.*4 \break \bar "||"
  \polyMark #'cu \markup { \box A \raise #1 \with-color #red \musicglyph "scripts.varsegno" }
  s1.*4 \break
  s1.*4 \break \bar "||" \mark #2
  s1.*4 \break
  s1.*4 \break
  s1.*4 \break \bar "||" \mark #3
  s1.*4 \break
  \polyMark #'rde \markup \right-column \pad-around #0.5 { "D.S. for Solos" "After Solos D.S. to Ending" }
  \polyMark #'lu \markup  { \vspace #3 \box Ending }

  \repeat volta 2 { s1.*2}
  \once \override Score.RehearsalMark.extra-offset = #'(-4 . -1)
  \polyMark #'cu \markup { \pad-around #1 \box "Wamp till cue" \pad-around #1 \box "On cue" }
  %\polyMark #'lu \markup { \pad-around #1 \box "On cue" }
  s1.
  \bar ".."
}

VoixI =  \relative c'' {
  \global
  R1.*4
  r2 as8 g des as' g2 ~ | 4. f8 r bes r f g es bes4-. |
  r2 bes'8 ces! fes,! bes es2 ~ | 1. |
  r2 des8 es c des~ des4 es,8 f | ges as f es ges4~ 2. |
  r2 aes8 des es, bes' f'2~ | 4. c8 r es r c des bes f4-. |
  \override Staff.KeySignature.color = #red
  \key g \major
  r2 a8 d e, b' fis'2~ | 1.
  r2 d8 e cis d4. fis,8 gis | a bes gis a~ a4~ a2. |
  gis8 a fis a gis4~ 2. | r4 r8 a' r e'~ 2. |
  r2 c8 b a c b2 | r2 gis8 a b c a4. e8 |
  fis1. | r4 r8 e r b'~ 2. |
  r2 g8 fis e g fis2 | r2 dis8 e fis gis e4. dis8 |
    \override Staff.KeySignature.color = #red
  \key a \major

  \repeat unfold 4 { cis4-. b8 cis~ 4~ 2. }

  \comp # 6 | \comp # 6 | \improvisationOn b1. \fermata
}

PianoRH =  \relative c' {
  \global
  \repeat percent 2 { <c es>4-. <bes des>8 <c es>8~ q4 ~ q2. | r4 <c es>4-. <bes des>8 <c es>8~ q2. }
}

PianoLH =  \relative c {
  \global \clef "bass"
  \repeat percent 2 { bes2 _"with Bass" r8 as r des r bes f4~ | 2. r8 as r des r f, }

}

PianoRHL =  \relative c' {
  \global
  \repeat percent 2 { <c es>4-. <bes des>8 <c es>8~ q4 ~ q2. | r4 <c es>4-. <bes des>8 <c es>8~ q2. }
  <c es>4-. <bes des>8 <c es>8~ q4 ~ q2. | r4 <c es>4-. <bes des>8 <c es>8~ q2.|
  <ces es>4-. <bes des>8 <ces es>8~ q4 ~ q2. | r4 <f as>4-. <es ges>8 <ces es>8~ q2.|
  \improvisationOn r2 es4~ 8 8~ 2 | 2 4~2. \improvisationOff
  <f as>4-. <es f>8 <f as>8~ q4 ~ q2. | r4 <f as>4-. <es f>8 <f as>8~  q2.
  \override Staff.KeySignature.color = #red
  \key g \major
  <fis a>4-. <f as>8 <fis a>8~ q4 ~ q2. | r4 <fis a>4-. <f as>8 <fis a>8~ q2.
  \improvisationOn r2 es4~8 8~ 2| 4. 4.~ 2.  | 2 4~ 2. | r4. 4 8~ 2.
  2. ~ 4 2 2 \improvisationOff b8 c d e c4. a8
 \improvisationOn 2 4~ 2. r4. 4 8~ 4 2 2 4~ 4 2 2.~ 4 2
  \improvisationOff
    \override Staff.KeySignature.color = #red
  \key a \major

  \repeat unfold 3 { <a cis>4-. <gis b>8 <a cis>8~ q4 ~ q2. | r4 <a cis>4-. <gis b>8 <a cis>8~ q2. }
  \improvisationOn b1. \fermata
}

Basse =  \relative c {
  \global
  \override TextSpanner.bound-details.left.text = "with Piano LH" \textSpannerDown
  % \partial 8
  \repeat percent 2 { bes2 \startTextSpan r8 as r des r bes f4~ | 2. r8 as r des r f, } \bar "||"
  bes2 r8 as r des r bes f4~ | 2. r8 as r des r f,
  f2 r8 as r ces r f, bes4~ | 2. r8 as r des r bes  \stopTextSpan
  es2 4~ 8 8~ 2 | as,2 4~ 2~ 8 as' |
  des,2 r8 as' r es' r des, as'4~ | 2. r8 as r es' r des,
  \override Staff.KeySignature.color = #red
  \key g \major
  c2 r8 g' r c r c, g'4~ | 2. r8 g r c r c, |
  b2 4~ 8 8~ 2 | fis'4. dis4.~ 2. |
  e2 r8 e' d bes b e, d b | a4. a'4 8~ 8 d, e2 |
  as,2.~ 8 as' g,4. d'8 | c2 fis8 g a b c4. d,8 |
  b2 fis'4~ 8 a b4. b,8 | e,2.~ 8 g b2 |
  bes2 bes'4~ 8 as8 a2 | gis2.~ 4 g2 |
    \override Staff.KeySignature.color = #red
  \key a \major

  b,2~ \startTextSpan 8 fis' r cis' r b, fis'4~ | 2. r8 fis r cis' r fis,
  \repeat unfold 2 { b,2~ 8 fis' r cis' r b, fis'4~ | 2. r8 fis r cis' r fis, } b,1. \stopTextSpan \fermata
}


accords = \chordmode {
  \set chordChanges = ##f
  bes1.*4:m7 bes1.*2:m7 f1.:m5-7 bes1.:9-
  es:m7 as2:7sus4 as1:5-7 des1.*2:7+9
  c:7+11+ b2:m1 b4.:m7+  b:m7 s4 b4.:m6/fis b:m/dis s2. e2:7sus4 e1:7  a1.:m7
  g1:sus4 g2:7 c1.:7+ b:m7 e:m7 b2:m6 g:m/bes d2/a gis1:dim7 g2:6
  b1.*4:9sus4 b1.:9sus4
}

grille = \chordmode {
  %\bar "[|:"
  \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \polyMark #'lu \markup { \box Intro }
  \repeat percent 4 { bes1:m7 } \break  \bar "||"
    \polyMark #'lu \markup { \concat { \box A " " \raise #1 \with-color #red \musicglyph "scripts.varsegno" } }

  \repeat percent 2 { bes1:m7 } f:m5-7 bes:9- \break
  es1:m7 as2:7sus as:5-7 \repeat percent 2 { des1:7+9 } \break \bar "||" \mark #2
  \repeat percent 2 { c:7+11+ } b4:1 b:m7+ b2:m7 b:m6/fis b:m/dis \break
  e:7sus4 e:7 a1:m7 g2:sus g:7 c1:7+ \break
  b:m7 e:m7 b4:m6 \repeat unfold 2 { g:/bes } d4/a gis2:dim7 g:6 \break \bar "||" \mark #3
  \repeat percent 4 { b1:9sus4 } \break \bar "||-[|:"
  \polyMark #'rde \markup \right-column \pad-around #0.5 { "D.S. for Solos" "After Solos D.S. to Ending" }
  \polyMark #'lu \markup \column { " " \vspace #3 \box Ending }
  \repeat volta 2 { \repeat percent 2 { b1:9sus4 } }
  \once \override Score.RehearsalMark.extra-offset = #'(-5 . -3)
    \polyMark #'cu \markup { \pad-around #1 \box "Wamp till cue" \pad-around #1 \box "On cue" }
\once \override Script.extra-offset = #'(6 . -5)
  b:9sus4 \fermata \bar ".."
\stopStaff s \bar "" }








%CTab
\book {
  \paper {
    #(set-paper-size "a5landscape")
    page-count = #2
    print-first-page-number = ##t
    number-pages-per-bookpart = ##t %% à décommenter si souhaité
    print-page-total = ##t %% à enlever si non souhaité
  }
  #(define output-suffix "CTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \accords }
        \new Devnull \Ossature
        \new PianoStaff \with { instrumentName = Piano } <<
          \new Staff \PianoRH
          \new Staff \PianoLH
        >>
        \new Staff \with {
          instrumentName = \markup {
            \center-column {
              \pad-around #1 \fontsize #-2 \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "}
              %\line { "" }
        } } }
        \new Voice \with { \consists "Pitch_squash_engraver" } \VoixI
      >>
    } % \message
} }

%Ca4
\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
    %print-page-number = ##f
    % print-first-page-number = ##t
    number-pages-per-bookpart = ##t
    print-page-total = ##t
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \accords }
        \new Devnull \Ossature
        \new PianoStaff \with { instrumentName = Piano } <<
          \new Staff \PianoRH
          \new Staff \PianoLH
        >>
        \new Staff \with {
          instrumentName = \markup {
            \center-column {
              \pad-around #1 \fontsize #-2 \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "}
              \line { "Ten. Sax" }
        } } }
        \new Voice \with { \consists "Pitch_squash_engraver" } \VoixI
      >>
    }
  } \bookpart {
    \paper { indent = 0 ragged-right = ##f }
    \new ChordGridScore <<
      \new ChordGrid \grille
    >>  \message
} }

%BbTab
\book {
  \paper {
    #(set-paper-size "a5landscape")
    page-count = #2
    print-first-page-number = ##t
    number-pages-per-bookpart = ##t %% à décommenter si souhaité
    print-page-total = ##t %% à enlever si non souhaité
  }
  #(define output-suffix "BbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \accords }
        \new Devnull \Ossature
        \new PianoStaff \with { instrumentName = Piano } <<
          \new Staff \PianoRH
          \new Staff \PianoLH
        >>
        \new Staff \with {
          instrumentName = \markup {
            \center-column {
              \pad-around #1 \fontsize #3 \circle \bold \concat {" " B \flat " "}
              \line { "Ten. Sax" }
        } } }
        \new Voice \with { \consists "Pitch_squash_engraver" } \transpose c d \VoixI
      >>
    } % \message
} }

%Bba4
\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
    %print-page-number = ##f
    % print-first-page-number = ##t
    number-pages-per-bookpart = ##t
    print-page-total = ##t
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \accords }
        \new Devnull \Ossature
        \new PianoStaff \with { instrumentName = Piano } <<
          \new Staff \PianoRH
          \new Staff \PianoLH
        >>
        \new Staff \with {
          instrumentName = \markup {
            \center-column {
              \pad-around #1 \fontsize #3 \circle \bold \concat {" " B \flat " "}
              \line { "Ten. Sax" }
        } } }
        \new Voice \with { \consists "Pitch_squash_engraver" } \transpose c d \VoixI
      >>
    }
  } \bookpart {
    \paper { indent = 0 ragged-right = ##f }
    \new ChordGridScore <<
      \new ChordGrid \transpose c d \grille
    >>  \message
} }

%EbTab
\book {
  \paper {
    #(set-paper-size "a5landscape")
    page-count = #2
    print-first-page-number = ##t
    number-pages-per-bookpart = ##t %% à décommenter si souhaité
    print-page-total = ##t %% à enlever si non souhaité
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \accords }
        \new Devnull \Ossature
        \new PianoStaff \with { instrumentName = Piano } <<
          \new Staff \PianoRH
          \new Staff \PianoLH
        >>
        \new Staff \with {
          instrumentName = \markup {
            \center-column {
              \pad-around #1 \fontsize #3 \circle \bold \concat {" " E \flat " "}
              \line { "Ten. Sax" }
        } } }
        \new Voice \with { \consists "Pitch_squash_engraver" } \transpose c a, \VoixI
      >>
    } % \message
} }

%Eba4
\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
    %print-page-number = ##f
    % print-first-page-number = ##t
    number-pages-per-bookpart = ##t
    print-page-total = ##t
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \accords }
        \new Devnull \Ossature
        \new PianoStaff \with { instrumentName = Piano } <<
          \new Staff \PianoRH
          \new Staff \PianoLH
        >>
        \new Staff \with {
          instrumentName = \markup {
            \center-column {
              \pad-around #1 \fontsize #3 \circle \bold \concat {" " E \flat " "}
              \line { "Ten. Sax" }
        } } }
        \new Voice \with { \consists "Pitch_squash_engraver" } \transpose c a, \VoixI
      >>
    }
  } \bookpart {
    \paper { indent = 0 ragged-right = ##f }
    \new ChordGridScore <<
      \new ChordGrid \transpose c a \grille
    >>  \message
} }


%BassTab
\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #2
    print-first-page-number = ##t
    number-pages-per-bookpart = ##t %% à décommenter si souhaité
    print-page-total = ##t %% à enlever si non souhaité
  }
  #(define output-suffix "RSTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \accords }
        \new Devnull \Ossature
        \new StaffGroup <<
          \new Staff \with { instrumentName = \markup { \center-column { Piano } } }
          \new Voice \with { \consists "Pitch_squash_engraver" } \PianoRHL
          \new Staff \with { instrumentName = Bass } { \clef "bass" \Basse }
      >> >>
    }
} }

%RSa4
\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
    print-page-number = ##f
  }
  #(define output-suffix "RSa4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \accords }
        \new Devnull \Ossature
        \new StaffGroup <<
          \new Staff \with { instrumentName = \markup { \center-column { Piano } } }
         \new Voice \with { \consists "Pitch_squash_engraver" } \PianoRHL
          \new Staff \with { instrumentName = Bass } { \clef "bass" \Basse }
      >> >>
    }
  } \bookpart {
    \paper { indent = 0 ragged-right = ##f }
    \new ChordGridScore <<
      \new ChordGrid \grille
    >>  %\message
} }
%Da4
\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
    print-page-number = ##t
    number-pages-per-bookpart = ##f
    print-page-total = ##t
  }
  #(define output-suffix "DTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \accords }
        \new Devnull \Ossature
        \new StaffGroup <<
          \new Staff \with { instrumentName = \markup { \center-column { "Ten. Sax." } } } \transpose c d \VoixI
          \new Staff \with { instrumentName = \markup { \center-column { Piano } } }
          \new Voice \with { \consists "Pitch_squash_engraver" } \PianoRHL
          \new Staff \with { instrumentName = Bass } { \clef "bass" \Basse }
      >> >>
    }
} }


%Da4
\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
    print-first-page-number = ##t
    print-page-number = ##t
    number-pages-per-bookpart = ##f
    print-page-total = ##t
  }
  #(define output-suffix "Da4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \accords }
        \new Devnull \Ossature
        \new StaffGroup <<
          \new Staff \with { instrumentName = \markup { \center-column { "Ten. Sax." } } } \transpose c d \VoixI
          \new Staff \with { instrumentName = \markup { \center-column { Piano } } }
          \new Voice \with { \consists "Pitch_squash_engraver" } \PianoRHL
          \new Staff \with { instrumentName = Bass } { \clef "bass" \Basse }
      >> >>
    }
  } \bookpart {
    \paper { indent = 0 ragged-right = ##f }
    \new ChordGridScore <<
      \new ChordGrid \grille
    >>  %\message
} }
